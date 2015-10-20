class ListSection < ActiveRecord::Base
  # Associations ---------------------------------------------------------------
  has_many :list_section_items
end
