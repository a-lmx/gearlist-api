class ListSectionSerializer < ActiveModel::Serializer
  attributes :id, :list_id, :section_name

  def section_name
    object.section.name
  end
end
