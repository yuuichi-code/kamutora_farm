class CreateTrainingActions < ActiveRecord::Migration[7.0]
  def change
    create_table :training_actions do |t|
      t.references :action, null: false, foreign_key: true
      t.references :chapter_turn, null: false, foreign_key: true
      t.references :post, null: false, foreign_key: true

      t.timestamps
    end
    add_index :training_actions, [:chapter_turn_id, :post_id], unique: true
  end
end
