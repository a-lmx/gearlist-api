class ListItem < ActiveRecord::Base
  # Associations ---------------------------------------------------------------
  belongs_to :list
  belongs_to :item
  # Validations ----------------------------------------------------------------
  validates :list_id, :item_id, presence: true
end
