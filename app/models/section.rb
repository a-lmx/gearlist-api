class Section < ActiveRecord::Base
  # Associations ---------------------------------------------------------------
  has_many :list_items

end
