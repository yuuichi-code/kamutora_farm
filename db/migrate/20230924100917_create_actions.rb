class CreateActions < ActiveRecord::Migration[7.0]
  def change
    create_table :actions do |t|
      t.string :content, null: false

      t.timestamps
    end
    add_index :actions, :content, unique: true
  end
end
