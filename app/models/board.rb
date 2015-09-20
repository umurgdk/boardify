class Board < ActiveRecord::Base
  belongs_to :user

  has_many :columns
  has_many :cards
end
