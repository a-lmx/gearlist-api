class List < ActiveRecord::Base
  # Associations ---------------------------------------------------------------
  has_many    :list_items
  has_many    :items, through: :list_items
  has_many    :sections, through: :list_items
  belongs_to  :user
  # Validations ----------------------------------------------------------------
  validates :name, :user_id, presence: true
end
