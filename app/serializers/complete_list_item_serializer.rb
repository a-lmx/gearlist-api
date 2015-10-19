class CompleteListItemSerializer < ActiveModel::Serializer
  attributes :id, :name, :category, :quantity, :section, :weight

  def name
    object.item.name
  end

  def category
    object.item.category
  end

  def weight
    object.item.weight
  end
end
