Rails.application.routes.draw do
  mount ActionCable.server => '/cable'

  devise_for :users, path: '', path_names: {
    sign_in: 'login',
    sign_out: 'logout',
    registration: 'signup'
  },
  controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  # post 'rails/active_storage/direct_uploads', to: 'direct_uploads#create'
  
  namespace :api do
    namespace :v1 do
      # 下拉選單 artist list
      get '/artists', to: 'users#artist_list'
      get '/artists_info', to: 'users#artists_info'
      resources :artist_infos, only: :show
      resources :auctions do
        get :latest, on: :collection
        get :price_range, on: :collection
      end
      resources :genres, only: :index

      namespace :auth do
        post '/upload_avatar', to: 'users#upload_avatar'
        get '/get_bids', to: 'bid_details#get_bids'
        resources :likes, only: [:create, :destroy] do
          get :state, on: :collection
          delete :remove_like, on: :collection
        end
        resources :users, only: [:show, :update ] do
          get :user_data, on: :member
        end
        resources :auctions, only: :create do
          get :bid_detail, on: :member
        end
        resources :bid_details, only: :create
      end
    end
  end  
end
