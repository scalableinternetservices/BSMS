class Preferences < ActiveRecord::Base
  belongs_to :user

  validates :user_id, presence: true
  validates :bedrooms, numericality: {only_integer: true}
  # validates :price, numericality: {only_integer: true}
  validates :parking, numericality: {only_integer: true}

end