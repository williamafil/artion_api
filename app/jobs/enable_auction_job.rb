class EnableAuctionJob < ApplicationJob
  queue_as :default

  def perform(id)
    auction = Auction.find_by(id: id)
    auction.toggle_is_active
    auction.save
  end
end
