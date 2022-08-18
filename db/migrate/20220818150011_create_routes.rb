class CreateRoutes < ActiveRecord::Migration[7.0]
  def change
    create_table :routes do |t|
      t.string :starting_point, array: true, default: []
      t.string :end_point, array: true, default: []

      t.timestamps
    end
  end
end
