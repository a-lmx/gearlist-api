class User < ActiveRecord::Base
  # Associations ---------------------------------------------------------------
  has_many :lists
  # Validations ----------------------------------------------------------------
  validates :username, :uid, :provider, presence: true

  def self.find_or_create_by_omniauth(uid, name, provider)
    user = User.where(
      uid: uid, 
      username: name, 
      provider: provider
    ).first_or_initialize

    user.token = generate_token

    return user.save ? user : nil
  end

  private

  # mahalo to @lilagrc for this token generator
  def self.generate_token
    SecureRandom.base64.tr('+/=', 'Qrt')
  end
end
