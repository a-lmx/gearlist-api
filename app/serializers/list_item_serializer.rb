class ListItemSerializer < ActiveModel::Serializer
  attributes :id, :list_id, :item_id, :quantity

  belongs_to :item
  belongs_to :list
end
