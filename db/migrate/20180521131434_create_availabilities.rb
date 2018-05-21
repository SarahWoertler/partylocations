class CreateAvailabilities < ActiveRecord::Migration[5.2]
  def change
    create_table :availabilities do |t|
      t.datetime :date
      t.string :status
      t.references :user, foreign_key: true, index: true
      t.references :location, foreign_key: true, index: true

      t.timestamps
    end
  end
end
