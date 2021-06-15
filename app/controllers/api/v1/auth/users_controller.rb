module Api
  module V1
    class Auth::UsersController < ApplicationController
      before_action :authenticate_user!

      def show
        @user = User.find(params[:id])

        render json: {
          status: 'SUCCESS', 
          message: 'Loaded auction bidding info',
          data: JSON.parse(
            @user.to_json(only: [:id, :name],
              # methods: ['total_likes'],
              include: [
                :likes,
                bid_details: {
                  include: [auction: {methods: :author_name}],
                },
                follows: {
                  methods: ['author_name', 'image_url']
                }
              ],
            )
          )
        }, status: :ok
      end

      def orders
        @user = User.find(params[:id])

        render json: {
          status: 'SUCCESS', 
          message: 'Loaded auction bidding info',
          data: JSON.parse(
            @user.to_json(only: [:id],
              include: :orders
            )
          )
        }, status: :ok
      end

      def artist_auctions
        @user = User.find(params[:id])

        render json: {
          status: 'SUCCESS', 
          message: 'Loaded auction bidding info',
          data: JSON.parse(
            @user.to_json(only: [:id, :name],
              # include: :bid_auctions
              include: :auctions
              # methods: ['number_of_follows', 'number_of_bids', 'number_of_auctions'],
            )
          )
        }, status: :ok
      end

      def user_data
        @user = User.find(params[:id])

        render json: {
          status: 'SUCCESS', 
          message: 'Loaded auction bidding info',
          data: JSON.parse(
            @user.to_json(only: [:id, :name],
              methods: ['number_of_follows', 'number_of_bids', 'number_of_auctions', 'number_of_unpaid_orders'],
            )
          )
        }, status: :ok
      end

      def upload_avatar
        @user = User.find(avatar_params[:user_id])
        @user.avatar.attach(avatar_params[:avatar])

        if @user.avatar.attached?
          avatar_serializer = AvatarSerializer.new(avatar: @user.avatar, user: @user)
          render json: avatar_serializer.serialize_new_avatar()
        else
          response = {
            error: @user.errors.full_messages.to_sentence
          }
          render json: response, status: :unprocessable_entity
        end
      end

      def update
        @user = User.find(params[:id])
        if @user.update(user_params)
          render json: {status: 'SUCCESS', message: '使用者名稱更新成功', data: @user}, status: :ok
        else
          render json: {status: 'ERROR', message: '使用者名稱更新失敗', data: @user}, status: :unprocessable_entity
        end
      end
      
      
      private
      
      def user_params
        params.require(:user).permit(:name, :is_artist, artist_info_attributes: [:description, :user_id, :email, :name, :_destroy])
      end

      def avatar_params
        params.permit(:avatar, :user_id)
      end
    end
  end
end