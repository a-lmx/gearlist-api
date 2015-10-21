class CompleteListSectionItemSerializer < ActiveModel::Serializer
  attributes :id, :name, :category, :quantity, :weight

  def name
    object.item.name
  end

  def category
    object.item.category
  end

  def section
    object.section.name
  end

  def weight
    object.item.weight
  end
end
