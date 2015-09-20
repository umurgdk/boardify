class CreateRoles < ActiveRecord::Migration
  def change
    create_table :roles do |t|
      t.references :board, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
      t.string :role
    end
  end
end
