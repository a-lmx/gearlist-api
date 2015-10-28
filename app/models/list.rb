class List < ActiveRecord::Base
  # Associations ---------------------------------------------------------------
  has_many    :list_sections, dependent: :destroy
  has_many    :list_section_items, through: :list_sections
  has_many    :items, through: :list_section_items
  has_many    :sections, through: :list_sections
  belongs_to  :user
  # Validations ----------------------------------------------------------------
  validates :name, :user_id, presence: true
  # Scopes ---------------------------------------------------------------------
  scope :published, -> { where(secret: false) }
  scope :by_age, -> { order(:created_at) }
  scope :by_newest, -> { order(updated_at: :desc) }

  def self.search(query)
    results = where(
      "((name like ?) or description like ?) and secret = ?", "%#{query}%", "%#{query}%", false
    ).by_newest
  end

  def self.feed(user_id)
    where(
      ["(secret = :secret1 and user_id = :user_id) or secret = :secret2", 
       { secret1: true, user_id: user_id, secret2: false }]
    ).by_newest
  end
end
