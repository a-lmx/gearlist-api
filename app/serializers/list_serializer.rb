class ListSerializer < ActiveModel::Serializer
  attributes :id, :name

  has_many    :list_items
  belongs_to  :user_id
end
