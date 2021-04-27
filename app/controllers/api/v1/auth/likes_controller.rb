module Api
  module V1
    class Auth::LikesController < ApplicationController
      before_action :authenticate_user!

      def create
        puts "- - - - Dashboard::LikesController (CREATE) - - - - "
        @like = Like.new(like_params)
        if @like.save
          render json:{
            status: 'SUCCESS',
            message: 'Liked an auction',
            data: JSON.parse(@like.to_json())
          }, status: :ok
        else
          render json: {
            status: 'ERROR', message: 'Fail to like an auction', data: @like
          }, status: :unprocessable_entity
        end
      end

      def destroy
        puts " ~~~~ DELETE ~~~~"
        @like = Like.find(params[:id])
        if @like.destroy
          render json: {status: 'SUCCESS', message: 'Remove Like', data: false}, status: :ok
        else
          render json: {status: 'SUCCESS', message: 'Fail', data: true}, status: :ok
        end
      end

      def remove_like
        puts " ~~~~ REMOVE LIKE ~~~~"
        user_id = params[:user_id]
        auction_id = params[:auction_id]

        @like = Like.find_by(user_id: user_id, auction_id: auction_id)
        if @like.destroy
          render json: {status: 'SUCCESS', message: 'Remove Like', data: false}, status: :ok
        else
          render json: {status: 'SUCCESS', message: 'Fail', data: true}, status: :ok
        end
      end

      def state
        user_id = params[:uid]
        auction_id = params[:aid]
        @like = Like.find_by(user_id: user_id, auction_id: auction_id)

        if @like.nil?
          render json:{
            status: 'ERROR',
            message: 'Like not available',
            data: false
          }, status: :ok
          
          # render json: {
          #   status: 'NOTFOUND', message: 'Like not available', data: false
          # }, status: :ok
        else
          # render json: {
          #   status: 'SUCCESS', message: 'Like available', data: true
          # }, status: :ok

          render json:{
            status: 'SUCCESS',
            message: 'Like available',
            data: JSON.parse(@like.to_json())
          }, status: :ok
        end
      end

      private

      def like_params
        params.require(:like).permit(:id, :auction_id, :user_id)
      end
      
    end
  end
end