class CompleteListSectionItemSerializer < ActiveModel::Serializer
  attributes :id, :name, :category, :quantity, :weight, :section

  def name
    object.item.name
  end

  def category
    object.item.category
  end

  def section
    object.list_section.section.name
  end

  def weight
    object.item.weight
  end
end
