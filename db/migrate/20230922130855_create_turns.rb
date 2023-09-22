class CreateTurns < ActiveRecord::Migration[7.0]
  def change
    create_table :turns do |t|
      t.integer :turn_number, null: false

      t.timestamps
    end
  end
end
