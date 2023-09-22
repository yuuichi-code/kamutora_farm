class CreateChapterTurns < ActiveRecord::Migration[7.0]
  def change
    create_table :chapter_turns do |t|
      t.references :chapter, null: false, foreign_key: true
      t.references :turn, null: false, foreign_key: true

      t.timestamps
    end
    add_index :chapter_turns, [:chapter_id, :turn_id], unique: true
  end
end
