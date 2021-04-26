class ArtistInfo < ApplicationRecord
  include Rails.application.routes.url_helpers

  has_many_attached :arts
  belongs_to :user

  def arts_url
    if arts.attached?
      arts.map do |image|
        {
          url: url_for(image),
          filename: image.blob[:filename]
        }
      end 
    end
  end
end
