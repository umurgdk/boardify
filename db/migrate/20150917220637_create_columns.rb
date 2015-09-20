class CreateColumns < ActiveRecord::Migration
  def change
    create_table :columns do |t|
      t.string :title
      t.integer :order
      t.integer :board_id
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
