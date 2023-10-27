class CreateFarmPlaces < ActiveRecord::Migration[7.0]
  def change
    create_table :farm_places do |t|
      t.integer :farm_number

      t.timestamps
    end
  end
end
