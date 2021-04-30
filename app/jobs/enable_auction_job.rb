class EnableAuctionJob < ApplicationJob
  queue_as :default

  def perform(id)
    puts "＃＃＃＃＃ 把 AUCTION ID: #{id} 打開＃＃＃＃＃"
    auction = Auction.find_by(id: id)
    puts "auction: #{auction.title}"
    auction.toggle_is_active
    auction.save
  end
end
