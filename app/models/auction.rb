class Auction < ApplicationRecord
  include Rails.application.routes.url_helpers

  extend FriendlyId
  friendly_id :title, use: :slugged

  has_many_attached :images

  has_many :likes, dependent: :destroy
  has_many :followers, through: :likes, source: :user

  has_many :bid_details, dependent: :destroy
  has_many :bidders, through: :bid_details, source: :user
  belongs_to :user
  belongs_to :genre

  def normalize_friendly_id(input)
    input.to_s.to_slug.normalize.to_s
  end

  def total_images
    images.length
  end

  def image_url
    if images.attached?
      url_for(images[0])
    end
  end

  def images_url
    if images.attached?
      images.map do |image|
        url_for(image)
      end 
    end
  end

  def author_name
    self.user.artist_info.name
    # user.name
  end

  def toggle_is_active
    self.toggle(:is_active)
  end
end
