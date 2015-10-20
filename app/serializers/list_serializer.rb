class ListSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :user_id

  # has_one     :user
  # has_many    :list_items
  # has_many    :items, through: :list_items
end
