class RemoveCoordinatesFomLocations < ActiveRecord::Migration[5.2]
  def change
    remove_column :locations, :lng
    remove_column :locations, :lat
  end
end
