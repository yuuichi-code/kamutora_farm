class CreateFlowerFields < ActiveRecord::Migration[7.0]
  def change
    create_table :flower_fields do |t|
      t.references :farm_place, null: false, foreign_key: true
      t.references :flower_seed, null: false, foreign_key: true
      t.references :chapter_turn, null: false, foreign_key: true
      t.references :post, null: false, foreign_key: true

      t.timestamps
    end
    add_index :flower_fields, [:farm_place_id, :chapter_turn_id, :post_id], unique: true, name: 'index_unique_on_farm_place_and_chapter_and_post_flower_fields'
  end
end
