class CreateFlowerSeeds < ActiveRecord::Migration[7.0]
  def change
    create_table :flower_seeds do |t|
      t.string :name, null: false

      t.timestamps
    end
    add_index :flower_seeds, :name, unique: true
  end
end
