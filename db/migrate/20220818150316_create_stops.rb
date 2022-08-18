class CreateStops < ActiveRecord::Migration[7.0]
  def change
    create_table :stops do |t|
      t.references :route, null: false, foreign_key: true
      t.references :highlight, null: false, foreign_key: true

      t.timestamps
    end
  end
end
