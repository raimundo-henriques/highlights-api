class CreateHighlights < ActiveRecord::Migration[7.0]
  def change
    create_table :highlights do |t|
      t.string :name
      t.string :address
      t.string :coordinates, array: true, default: []

      t.timestamps
    end
  end
end
