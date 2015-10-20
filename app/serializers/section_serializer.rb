class SectionSerializer < ActiveModel::Serializer
  attributes :id, :name

  has_many :list_items, serializer: CompleteListItemSerializer

  def list_items
    object.list_items
  end
end
