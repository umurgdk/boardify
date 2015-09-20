class Card < ActiveRecord::Base
  belongs_to :column
  belongs_to :board
  belongs_to :user

  has_many :votes
  has_many :voted_users, through: :votes, class_name: "User"

  default_scope { order(order: :asc) }
end
