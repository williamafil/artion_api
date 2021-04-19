module Api
  module V1
    class AuctionsController < ApplicationController
      def index
        puts "======= AUCTIONS#INDEX ======="
        @auctions = Auction.all
        render json:{
                      status: 'SUCCESS',
                      message: 'Loaded auctions',
                      data: @auctions.map{|item| item.as_json.merge({images: item.images.map{|img| url_for(img)}})}
        }, status: :ok

        # render json:
        #   @auctions.map {|work| work.as_json.merge({
        #     images: work.images.map{|img| (url_for(img))}
        #     })
        #   }, status: :ok
      end
    end
  end
end