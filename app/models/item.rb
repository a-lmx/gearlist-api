class Item < ActiveRecord::Base
  # Validations ----------------------------------------------------------------
  validates :name, :category, :weight, presence: true
  validates :weight, numericality: { only_integer: true, greater_than: 0 }
end
