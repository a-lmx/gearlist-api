class User < ActiveRecord::Base
  # Associations ---------------------------------------------------------------
  has_many :lists
  # Validations ----------------------------------------------------------------
  validates :username, :uid, :provider, presence: true

  def self.find_or_create_by_omniauth(uid, name, provider)
    user = User.where(uid: uid, name: name, provider: provider).first_or_initialize

    return user.save ? user : nil
  end

  def set_token
    
  end
end
