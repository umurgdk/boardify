class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.string :title, null: false
      t.integer :votes, null: false
      t.integer :user_id, null: false

      t.timestamps null: false
    end

    add_index :cards, :user_id
  end
end
