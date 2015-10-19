class ListItem < ActiveRecord::Base
  # Associations ---------------------------------------------------------------
  belongs_to :list
  belongs_to :item
  belongs_to :section
  # Validations ----------------------------------------------------------------
  validates :list_id, :item_id, :section_id, presence: true
end
