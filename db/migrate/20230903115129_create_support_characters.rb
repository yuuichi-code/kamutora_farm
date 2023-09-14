class CreateSupportCharacters < ActiveRecord::Migration[7.0]
  def change
    create_table :support_characters do |t|
      t.references :post,      null: false, foreign_key: true
      t.references :character, null: false, foreign_key: true

      t.timestamps
    end
    add_index :support_characters, [:post_id, :character_id], unique: true
  end
end
