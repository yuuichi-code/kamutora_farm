class CreateChapters < ActiveRecord::Migration[7.0]
  def change
    create_table :chapters do |t|
      t.integer :chapter_number, null: false

      t.timestamps
    end
    add_index :chapters, :chapter_number, unique: true
  end
end
