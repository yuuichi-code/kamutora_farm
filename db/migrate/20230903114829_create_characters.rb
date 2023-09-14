class CreateCharacters < ActiveRecord::Migration[7.0]
  def change
    create_table :characters do |t|
      t.string :name,            null: false
      t.integer :unit_element,   null: false
      t.integer :initial_rarity, null: false

      t.timestamps
    end
    add_index :characters, :name, unique: true
  end
end
