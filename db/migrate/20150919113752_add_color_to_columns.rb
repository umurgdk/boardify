class AddColorToColumns < ActiveRecord::Migration
  def change
    add_column :columns, :color, :string
  end
end
