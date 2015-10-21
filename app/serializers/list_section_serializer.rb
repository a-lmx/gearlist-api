class ListSectionSerializer < ActiveModel::Serializer
  attributes :id, :list_id, :name

  def name
    object.section.name
  end
end
