class User < ApplicationRecord
  include Rails.application.routes.url_helpers
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :jwt_authenticatable, jwt_revocation_strategy: JwtDenylist

  has_one_attached :avatar

  has_many :auctions

  def avatar_url
    if self.avatar.attached?
      url_for(self.avatar)
    end
  end
end
