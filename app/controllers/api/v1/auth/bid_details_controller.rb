module Api
  module V1
    class Auth::BidDetailsController < ApplicationController
      before_action :authenticate_user!

      def create
        @bid = BidDetail.new(bid_params)
        puts "- - - - - - - - - - - - - -"
        puts "@bid.auction_id 是什麼"
        puts @bid.auction_id
        puts "- - - - - - - - - - - - - - "
        puts "接收到的投標金額 @bid.bid"
        puts @bid.bid
        puts "- - - - - - - - - - - - - -"
        @auction = Auction.find_by(id: @bid.auction_id)
        @current_bids = BidDetail.where(auction_id: @bid.auction_id)
        puts "@@@"
        # puts @auction
        puts @current_bids
        puts "@@@"


        if @current_bids.length == 0
          puts "bidding_detail 空的"
          if @bid.bid > @auction.bidding_price
            puts "成功：出價大於起標金額"

            if @bid.save
              params = JSON.parse(@bid.to_json(
                  include: [
                    user: {only: [:name]}
                  ]
                ))

              ActionCable.server.broadcast "bid_channel_#{bid_params[:auction_id]}", message: params

              render json: {
                status: 'SUCCESS',
                message: '投標成功！',
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
          else
            puts "出價小於起標金額"
            render json: {
                status: 'FAIL',
                message: '投標失敗，金額低於起標價格！',
                data: JSON.parse(@bid.to_json(
                  include: [
                    user: {only: [:name]}
                  ]
                ))
              }, status: :ok
          end
        else
          # 此Auction.bid_details 不為空
          if @bid.bid > @current_bids.last.bid
            puts "成功：出價大於上次出價"

            if @bid.save
              params = JSON.parse(@bid.to_json(
                  include: [
                    user: {only: [:name]}
                  ]
                ))

              ActionCable.server.broadcast "bid_channel_#{bid_params[:auction_id]}", message: params

              render json: {
                status: 'SUCCESS',
                message: '投標成功！',
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
          else
            puts "出價小於上次出價"
            render json: {
                status: 'FAIL',
                message: '投標失敗，金額低於目前出價！',
                data: JSON.parse(@bid.to_json(
                  include: [
                    user: {only: [:name]}
                  ]
                ))
              }, status: :ok
          end
        end

        # if @bid.save
        #   params = JSON.parse(@bid.to_json(
        #       include: [
        #         user: {only: [:name]}
        #       ]
        #     ))

        #   ActionCable.server.broadcast "bid_channel_#{bid_params[:auction_id]}", message: params

        #   render json: {
        #     status: 'SUCCESS',
        #     message: 'Bid saved',
        #     data: JSON.parse(@bid.to_json(
        #       include: [
        #         user: {only: [:name]}
        #       ]
        #     ))
        #   }, status: :ok
        # else
        #   render json: {
        #     status: 'ERROR', message: 'Fail to save this bid', data: @bid
        #   }, status: :unprocessable_entity
        # end
      end
      
      private

      def bid_params
        params.require(:bid_details).permit(:user_id, :auction_id, :bid)
      end
    end
  end
end