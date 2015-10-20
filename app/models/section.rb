class Section < ActiveRecord::Base
  # Associations ---------------------------------------------------------------
  has_many  :list_sections
  has_many  :list_section_items, through: :list_sections
  has_many  :items, through: :list_section_items
end
