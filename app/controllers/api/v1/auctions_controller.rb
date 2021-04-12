module Api
  module V1
    class AuctionsController < ApplicationController
      def index
        @auctions = Auction.all
        render json:{
                      status: 'SUCCESS',
                      message: 'Loaded auctions',
                      data: @auctions
                    }, status: :ok
      end
    end
  end
end