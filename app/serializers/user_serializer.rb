class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :uid

  # has_many :lists
end
