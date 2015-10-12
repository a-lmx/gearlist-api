class ListItem < ActiveRecord::Base
  # Validations ----------------------------------------------------------------
  validates :list_id, :item_id, presence: true
end
