class Card < ActiveRecord::Base
  belongs_to :column
  belongs_to :board
end
