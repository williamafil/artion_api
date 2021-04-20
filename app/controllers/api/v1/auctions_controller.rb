module Api
  module V1
    class AuctionsController < ApplicationController
      def index
        puts "======= AUCTIONS#INDEX ======="
        @auctions = Auction.all
        render json:{
                      status: 'SUCCESS',
                      message: 'Loaded auctions',
                      data: JSON.parse(@auctions.to_json(
                        methods: ['images_url'],
                        include: [
                          user: {only: [:name]},
                          genre: {only: [:name]}
                        ])
                      )
                      # data: (
                      #   @auctions.map{|item| item.as_json.merge({images: item.images.map{|img| url_for(img)}})}
                      # ),
        }, status: :ok
      end

      def show
        @auction = Auction.friendly.find(params[:id])

        render json:{
                      status: 'SUCCESS',
                      message: 'Loaded auction',
                      data: JSON.parse(@auction.to_json(
                        methods: ['images_url'],
                        include: [
                          user: {only: [:name]},
                          genre: {only: [:name]}
                        ])
                      )
                      # data: (
                      #   @auctions.map{|item| item.as_json.merge({images: item.images.map{|img| url_for(img)}})}
                      # ),
        }, status: :ok
      end
    end
  end
end