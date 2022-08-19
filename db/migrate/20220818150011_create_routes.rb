class CreateRoutes < ActiveRecord::Migration[7.0]
  def change
    create_table :routes do |t|
      t.string :starting_point
      t.string :end_point

      t.timestamps
    end
  end
end
