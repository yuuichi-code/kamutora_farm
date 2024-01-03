class CreateTrainingAdvices < ActiveRecord::Migration[7.0]
  def change
    create_table :training_advices do |t|
      t.string :content, null: false
      t.references :chapter_turn, null: false, foreign_key: true
      t.references :post, null: false, foreign_key: true

      t.timestamps
    end
    add_index :training_advices, [:chapter_turn_id, :post_id], unique: true
  end
end
