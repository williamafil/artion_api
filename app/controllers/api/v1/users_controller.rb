module Api
  module V1
    class UsersController < ApplicationController
      def artist_list
        @users = User.where(is_artist: true)
        render json:{
        status: 'SUCCESS',
        message: 'Loaded artists',
        data: JSON.parse(@users.to_json(
          only: [:id],
          include: [
            artist_info: {
              only: [:name]
            }
          ]
        ))
        }, status: :ok
      end

      def artists_info
        @users = User.where(is_artist: true)
        render json:{
        status: 'SUCCESS',
        message: 'Loaded artists',
        data: JSON.parse(@users.to_json(
          methods: ['avatar_url'],
          include: [:artist_info]
        ))
        }, status: :ok
      end
    end
  end
end