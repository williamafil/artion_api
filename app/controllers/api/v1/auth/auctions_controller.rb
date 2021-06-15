module Api
  module V1
    class Auth::AuctionsController < ApplicationController
      before_action :authenticate_user!

      def create
        @auction = Auction.new(auction_params)

        if @auction.save
          EnableAuctionJob.set(wait_until: @auction.start_time).perform_later(@auction.id)
          DisableAuctionJob.set(wait_until: @auction.end_time + 1.second).perform_later(@auction.id)
          
          render json:{
            status: 'SUCCESS',
            message: 'Loaded auction',
            data: JSON.parse(@auction.to_json(
              methods: ['images_url', 'author_name'],
              include: [
                user: {only: [:name]},
                genre: {only: [:name]}
              ])
            )
          }, status: :ok
        else
          render json: {
            status: 'ERROR', message: 'Fail to like a place', data: @auction
          }, status: :unprocessable_entity
        end
      end

      def bid_detail
        @auction = Auction.friendly.find(params[:id])

        render json: {
          status: 'SUCCESS', 
          message: 'Loaded auction bidding info',
          data: JSON.parse(
            @auction.to_json(only: [:id, :slug],
              include: [
                bid_details: {
                  only: [:bid, :user_id, :created_at],
                  methods: ['user_name'],
                  include: [
                    user: {
                      only: [:name],
                      methods: ['avatar_url']
                    }
                  ]
                }
              ],
            )
          )
        }, status: :ok
      end
      
      private

      def auction_params
        params.permit(:title, :description, :bidding_price, :interval, :start_time, :end_time, :is_active, :user_id, :genre_id, images: [])
      end
      
    end
  end
end