class ListSectionItem < ActiveRecord::Base
  # Associations ---------------------------------------------------------------
  belongs_to :list_section
  belongs_to :item
  # Validations ----------------------------------------------------------------
  validates :list_section_id, :item_id, presence: true
end
