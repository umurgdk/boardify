class CardSerializer < ActiveModel::Serializer
  attributes :id, :title, :votes, :voted_user_ids, :order

  #has_many :votes

  def voted_user_ids
    object.votes.map(&:user_id)
  end

  def votes
    object.votes.count
  end
end
