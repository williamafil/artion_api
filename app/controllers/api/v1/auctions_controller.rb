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
                        methods: ['images_url', 'author_name'],
                        include: [
                          user: {
                            only: [:name],
                            methods: [:artist_name]
                          },
                          genre: {only: [:name]}
                        ])
                      )
                      # data: (
                      #   @auctions.map{|item| item.as_json.merge({images: item.images.map{|img| url_for(img)}})}
                      # ),
        }, status: :ok
      end

      def recent
        @auctions = Auction.where("start_time >= ?", DateTime.now).order("title DESC").limit(5)
        render json:{
                      status: 'SUCCESS',
                      message: 'Loaded auctions',
                      data: JSON.parse(@auctions.to_json(
                        methods: ['images_url', 'author_name'],
                        include: [
                          user: {
                            only: [:name],
                            methods: [:artist_name]
                          },
                          genre: {only: [:name]}
                        ])
                      )
                      # data: (
                      #   @auctions.map{|item| item.as_json.merge({images: item.images.map{|img| url_for(img)}})}
                      # ),
        }, status: :ok
      end

      def in_progress
        @auction = Auction.where(":date BETWEEN start_time AND end_time", date: DateTime.now).order('id DESC').limit(5)
        render json:{
                      status: 'SUCCESS',
                      message: 'Loaded auction',
                      data: JSON.parse(@auction.to_json(
                        methods: ['images_url', 'author_name'],
                        include: [
                          user: {
                            only: [:name],
                            methods: [:artist_name]
                          },
                          genre: {only: [:name]}
                        ])
                      )
                      # data: (
                      #   @auctions.map{|item| item.as_json.merge({images: item.images.map{|img| url_for(img)}})}
                      # ),
        }, status: :ok
      end

      def latest
        # @auction = Auction.last
        # @auction = Auction.where("Date.today >= start_time AND Date.today <= end_time").order("title DESC").limit(5)
        @auction = Auction.where(":date BETWEEN start_time AND end_time", date: DateTime.now).order('id DESC').limit(1)[0]
        render json:{
                      status: 'SUCCESS',
                      message: 'Loaded auction',
                      data: JSON.parse(@auction.to_json(
                        methods: ['images_url', 'author_name'],
                        include: [
                          user: {
                            only: [:name],
                            methods: [:artist_name]
                          },
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
                        methods: ['images_url', 'author_name'],
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

      def price_range
        @auctions = Auction.pluck(:bidding_price)
        # max = @auctions.max
        # min = @auctions.min
        # diff = (max - min) / 5

        # arr = @auctions.min.step(to: @auctions.max + diff, by: diff).each_cons(2).map { |a, b| a..b }

        render json:{
          status: 'SUCCESS',
          message: 'Loaded auctions',
          data: JSON.parse({min: @auctions.min, max: @auctions.max}.to_json())
        }, status: :ok
      end
    end
  end
end