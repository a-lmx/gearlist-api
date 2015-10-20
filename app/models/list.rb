class List < ActiveRecord::Base
  # Associations ---------------------------------------------------------------
  has_many    :list_sections
  has_many    :list_section_items, through: :list_sections
  has_many    :items, through: :list_section_items
  has_many    :sections, through: :list_sections
  belongs_to  :user
  # Validations ----------------------------------------------------------------
  validates :name, :user_id, presence: true
end
