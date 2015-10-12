class List < ActiveRecord::Base
  # Validations ----------------------------------------------------------------
  validates :name, :user_id, presence: true
end
