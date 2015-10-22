class User < ActiveRecord::Base
  # Associations ---------------------------------------------------------------
  has_many :lists
  # Validations ----------------------------------------------------------------
  validates :username, :uid, :provider, presence: true
end
