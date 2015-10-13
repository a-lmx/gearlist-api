class ItemSerializer < ActiveModel::Serializer
  attributes :id, :name, :category, :weight
end
