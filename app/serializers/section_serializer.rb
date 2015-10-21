class SectionSerializer < ActiveModel::Serializer
  attributes :id, :name

  has_many :list_section_items, serializer: CompleteListSectionItemSerializer

  def name
    object.section.name
  end

  def list_section_items
    object.list_section_items
  end
end
