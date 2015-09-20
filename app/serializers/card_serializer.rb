class CardSerializer < ActiveModel::Serializer
  attributes :id, :title, :votes, :order
end
