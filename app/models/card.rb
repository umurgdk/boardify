class Card < ActiveRecord::Base
  belongs_to :column
  belongs_to :board

  default_scope { order(order: :asc) }
end
