class ListSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :secret, :user_id, :user_name

  def user_name
    object.user.username
  end
end
