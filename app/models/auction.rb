class Auction < ApplicationRecord
  include Rails.application.routes.url_helpers

  extend FriendlyId
  friendly_id :title, use: :slugged

  has_many_attached :images
  has_many :bid_details
  has_many :bidders, through: :bid_details, source: :user
  belongs_to :user
  belongs_to :genre

  # 原本是input.to_s.parameterize，但是parameterize只支援英文跟數字，所以改用babosa的to_slug
  def normalize_friendly_id(input)
    input.to_s.to_slug.normalize.to_s
  end

  def total_images
    images.length
  end

  def images_url
    if images.attached?
      images.map do |image|
        url_for(image)
      end 
    end
  end

  # def images_url
  #   if self.images.attached?
  #     url_for(self.images)
  #   end
  # end

  # def image_url
  #   self.images.each do |image|
  #     Rails.application.routes.url_helpers.rails_blob_path(image, only_path: true)
  #   end 
  # end
  # def image_url
  #   Rails.application.routes.url_helpers.rails_blob_path(self.images, only_path: true)
  # end

end
