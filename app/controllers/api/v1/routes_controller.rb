require "open-uri"

class Api::V1::RoutesController < Api::V1::BaseController
  def show
    @route = Route.find(params[:id])
  end

  def create
    @route = Route.new(route_params)

    if @route.end_point.nil?
      poi_json = fetch_highlight(@route.starting_point)
      unless poi_json["features"].empty?
        name = poi_json["features"][0]["properties"]["name"]
        coordinates = poi_json["features"][0]["geometry"]["coordinates"].join(',')
        highlight = Highlight.create(name: name, coordinates: coordinates)
        @route.highlights << highlight
      end
    else
      mapbox_json = fetch_route(@route.starting_point, @route.end_point)
      path_coordinates = mapbox_json["routes"][0]["geometry"]["coordinates"].map do |coordinates|
        coordinates.join(',')
      end
      path_coordinates.each do |coordinates|
        poi_json = fetch_highlight(coordinates)
        next if poi_json["features"].empty?
        next if poi_json["features"][0]["properties"]["name"].nil?

        name = poi_json["features"][0]["properties"]["name"]
        coordinates = poi_json["features"][0]["geometry"]["coordinates"].join(',')
        highlight = Highlight.create(name: name, coordinates: coordinates)
        @route.highlights << highlight
      end
    end

    @route.save

    render :show
  end

  private

  def fetch_route(starting_point, end_point)
    mapbox_url = "https://api.mapbox.com/directions/v5/mapbox/driving/#{starting_point};#{end_point}?geometries=geojson&access_token=#{ENV['MAPBOX_API_KEY']}"
    mapbox_serialized = URI.open(mapbox_url).read
    JSON.parse(mapbox_serialized)
  end

  def fetch_highlight(coordinates)
    poi_url = "https://api.mapbox.com/v4/mapbox.mapbox-streets-v8/tilequery/#{coordinates}.json?radius=1000&limit=1&dedupe&layers=poi_label&geometry=point&access_token=#{ENV['MAPBOX_API_KEY']}"
    poi_serialized = URI.open(poi_url).read
    JSON.parse(poi_serialized)
  end

  def route_params
    params.require(:route).permit(:starting_point, :end_point)
  end
end
