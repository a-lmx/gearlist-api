class CompleteListItemSerializer < ActiveModel::Serializer
  attributes :id, :name, :category, :quantity, :section

  def name
    object.item.name
  end

  def category
    object.item.category
  end
end
