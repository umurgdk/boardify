class AddOrderToCards < ActiveRecord::Migration
  def change
    add_column :cards, :order, :integer
  end
end
