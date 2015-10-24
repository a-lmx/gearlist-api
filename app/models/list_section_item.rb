class ListSectionItem < ActiveRecord::Base
  # Associations ---------------------------------------------------------------
  belongs_to :list_section
  belongs_to :item
  has_one :list, through: :list_section
  has_one :section, through: :list_section
  # Validations ----------------------------------------------------------------
  validates :list_section_id, :item_id, presence: true
end
