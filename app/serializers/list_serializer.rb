class ListSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :secret, :user_id
end
