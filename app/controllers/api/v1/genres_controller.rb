module Api
  module V1
    class GenresController < ApplicationController
      def index
        @genres = Genre.all
        render json:{
        status: 'SUCCESS',
        message: 'Loaded genre',
        data: JSON.parse(@genres.to_json(only: [:id, :name]))
        }, status: :ok
      end
    end
  end
end