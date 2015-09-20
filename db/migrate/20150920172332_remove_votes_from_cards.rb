class RemoveVotesFromCards < ActiveRecord::Migration
  def change
    remove_column :cards, :votes
  end
end
