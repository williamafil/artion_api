class BidDetail < ApplicationRecord
  belongs_to :auction
  belongs_to :user

  def user_name
    self.user.name
  end
end
