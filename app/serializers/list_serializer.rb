class ListSerializer < ActiveModel::Serializer
  attributes :id, :name

  has_many    :list_items
  has_one     :user
end
