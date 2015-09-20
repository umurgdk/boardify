class BoardSerializer < ActiveModel::Serializer
  #embed :ids, include: true
  attributes :id, :title

  has_many :columns, serializer: ColumnSerializer
end
