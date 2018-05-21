class CreateLocations < ActiveRecord::Migration[5.2]
  def change
    create_table :locations do |t|
      t.string :name
      t.string :description
      t.integer :size
      t.integer :capacity
      t.integer :price
      t.string :lat
      t.string :lng
      t.string :location_type
      t.string :occasion
      t.boolean :accessible
      t.boolean :catering
      t.boolean :parking
      t.boolean :smoking
      t.boolean :music
      t.references :user, foreign_key: true, index: true

      t.timestamps
    end
  end
end
