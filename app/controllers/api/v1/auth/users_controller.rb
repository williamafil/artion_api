module Api
  module V1
    class Auth::UsersController < ApplicationController
      before_action :authenticate_user!

      def upload_avatar
        puts '### upload avatar ###'
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
      
      private
      def avatar_params
        params.permit(:avatar, :user_id)
      end
    end
  end
end