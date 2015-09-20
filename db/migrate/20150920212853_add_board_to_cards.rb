class AddBoardToCards < ActiveRecord::Migration
  def change
    add_reference :cards, :board, index: true, foreign_key: true
  end
end
