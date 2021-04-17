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
        params.require(:user).permit(:name)
      end

      def avatar_params
        params.permit(:avatar, :user_id)
      end
    end
  end
end