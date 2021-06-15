class DisableAuctionJob < ApplicationJob
  queue_as :default

  def perform(id)
    auction = Auction.find_by(id: id)
    auction.toggle_is_active
    auction.save

    winner = auction.bid_details.max_by{|item| item.bid}
    # #<BidDetail id: 42, user_id: 13, auction_id: 2, bid: 500000000, created_at: "2021-04-28 06:57:12", updated_at: "2021-04-28 06:57:12">
    Order.create(
      user_id: winner.user_id,
      auction_id: auction.id,
      order_number: Time.now.strftime("%Y%m%d%H%M%S%s"),
      total_price: winner.bid,
      title: auction.title,
      billing_name: '',
      billing_address: '',
      shipping_name: '',
      shipping_address: ''
    )
  end
end