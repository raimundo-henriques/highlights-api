json.extract! @route, :id, :starting_point, :end_point
json.highlights @route.highlights do |highlight|
  json.extract! highlight, :id, :name, :coordinates
end
