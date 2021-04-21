module Api
  module V1
    class Auth::AuctionsController < ApplicationController
      before_action :authenticate_user!

      def index
        puts "==== auctions ===="
      end

      def bid_detail
        puts "==== auctions#bid_detail"
        @auction = Auction.friendly.find(params[:id])

        render json: {
          status: 'SUCCESS', 
          message: 'Loaded auction bidding info',
          data: JSON.parse(
            @auction.to_json(only: [:id, :slug],
              # methods: ['total_likes'],
              include: [
                bid_details: {
                  only: [:bid, :user_id, :created_at],
                  include: [
                    user: {
                      only: [:name],
                      methods: ['avatar_url']
                    }
                  ]
                  # methods: ['avatar_url']
                }
              ],
            )
          )
        }, status: :ok
      end
      
    end
  end
end