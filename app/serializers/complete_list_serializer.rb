class CompleteListSerializer < ActiveModel::Serializer
  attributes :id, :name, :description

  has_many :list_sections, serializer: SectionSerializer
end
