class ColumnSerializer < ActiveModel::Serializer
  embed :ids, include: true
  attributes :id, :title, :order, :color

  has_many :cards
end
