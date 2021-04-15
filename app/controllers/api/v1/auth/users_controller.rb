module Api
  module V1
    class Auth::UsersController < ApplicationController
      before_action :authenticate_user!

    end
  end
end