class AddColumnIdToCards < ActiveRecord::Migration
  def change
    add_column :cards, :column_id, :integer
  end
end
