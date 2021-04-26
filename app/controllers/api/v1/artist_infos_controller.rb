module Api
  module V1
    class ArtistInfosController < ApplicationController
      def show
        @artist = ArtistInfo.find_by(name: params[:id])
        render json:{
        status: 'SUCCESS',
        message: 'Loaded artists',
        data: JSON.parse(@artist.to_json(
          methods: ['arts_url'],
          include: [
            user: {
              only: :id,
              methods: ['avatar_url']
            }
          ]
        ))
        }, status: :ok
      end
    end
  end
end