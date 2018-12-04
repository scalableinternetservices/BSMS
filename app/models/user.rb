class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_one :preferences, :dependent => :destroy
  has_many :listings
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  devise :omniauthable, :omniauth_providers => [:facebook]

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.name = auth.info.name   # assuming the user model has a name
      user.image = auth.info.image # assuming the user model has an image
    end
  end

  def average_rating
		Rails.cache.fetch("#{cache_key}/average_rating", expires_in: 12.hours) do
      listings_with_reviews = self.listings.select { |listing| listing.listing_reviews.size > 0 }
      average_ratings = listings_with_reviews.map { |listing| listing.avg_rating }
      if not average_ratings.first.nil?
        avg = average_ratings.reduce(:+) / listings_with_reviews.size.to_f
        if avg == 0.0
          'N/A'
        else
          avg
        end
      else
        'N/A'
      end
    end
  end
end
