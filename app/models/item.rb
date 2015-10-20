class Item < ActiveRecord::Base
  # Associations ---------------------------------------------------------------
  has_many :list_section_items
  # Validations ----------------------------------------------------------------
  validates :name, :category, :weight, presence: true
  validates :weight, numericality: { only_integer: true, greater_than: 0 }
end
