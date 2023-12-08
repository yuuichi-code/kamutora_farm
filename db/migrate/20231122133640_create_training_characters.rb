class CreateTrainingCharacters < ActiveRecord::Migration[7.0]
  def change
    create_table :training_characters do |t|
      t.integer :hp
      t.integer :atk
      t.integer :def
      t.integer :spd
      t.integer :crt
      t.integer :crd
      t.integer :hit
      t.integer :avd
      t.integer :max_exp
      t.references :character, null: false, foreign_key: true
      t.references :post, null: false, foreign_key: true

      t.timestamps
    end
    add_index :training_characters, [:chapter_id, :post_id], unique: true
  end
end
