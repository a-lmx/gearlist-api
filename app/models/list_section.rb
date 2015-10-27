class ListSection < ActiveRecord::Base
  # Associations ---------------------------------------------------------------
  has_many :list_section_items, dependent: :destroy
  
  belongs_to :list
  belongs_to :section
end
