class User < ActiveRecord::Base
  has_secure_password
  # Associations ---------------------------------------------------------------
  has_many :lists
  # Validations ----------------------------------------------------------------
  validates :username, :uid, presence: true
end
