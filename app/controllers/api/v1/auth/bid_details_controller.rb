module Api
  module V1
    class Auth::BidDetailsController < ApplicationController
      before_action :authenticate_user!

      def create
        puts "==== create ===="
        # @user_id = params[:user_id]
        # @auction_id = params[:auction_id]

        puts "^^^^^^^^^^^^^^^^^^^^^"
        # puts "params[:auction_id]"
        puts bid_params[:auction_id]
        puts "^^^^^^^^^^^^^^^^^^^^^"

        @bid = BidDetail.new(bid_params)
        if @bid.save
          params = JSON.parse(@bid.to_json(
              include: [
                user: {only: [:name]}
              ]
            ))

          # puts "= = = = = params = = = = = "
          # puts params
          # puts "= = = = = params = = = = = "
          puts " @ @ @ @ ActionCable.server.broadcast @ @ @ @ "
          ActionCable.server.broadcast "bid_channel_#{bid_params[:auction_id]}", message: params
          # ActionCable.server.broadcast "bid_channel_#{@auction_id}", message: params
          # ActionCable.server.broadcast 'bid_channel', message: params

          render json: {
            status: 'SUCCESS',
            message: 'Bid saved',
            data: JSON.parse(@bid.to_json(
              include: [
                user: {only: [:name]}
              ]
            ))
          }, status: :ok
        else
          render json: {
            status: 'ERROR', message: 'Fail to save this bid', data: @bid
          }, status: :unprocessable_entity
        end
      end
      
      private

      def bid_params
        params.require(:bid_details).permit(:user_id, :auction_id, :bid)
      end
    end
  end
end