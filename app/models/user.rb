class User < ApplicationRecord
  include Rails.application.routes.url_helpers
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :jwt_authenticatable, jwt_revocation_strategy: JwtDenylist

  has_one_attached :avatar

  has_many :likes
  has_many :follows, through: :likes, source: :auction

  has_many :bid_details
  has_many :auctions
  # has_many :bid_auctions, through: :bid_details, source: :auction
  
  has_one :artist_info
  accepts_nested_attributes_for :artist_info, allow_destroy: true

  def avatar_url
    if self.avatar.attached?
      url_for(self.avatar)
    end
  end

  def artist_name
    self.artist_info.name
  end

  def number_of_follows
    follows.length
  end

  def number_of_bids
    bid_details.length
  end

  def number_of_auctions
    # bid_auctions.length
    auctions.length
  end
end
