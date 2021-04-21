Rails.application.routes.draw do
  devise_for :users, path: '', path_names: {
    sign_in: 'login',
    sign_out: 'logout',
    registration: 'signup'
  },
  controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  post 'rails/active_storage/direct_uploads', to: 'direct_uploads#create'
  
  namespace :api do
    namespace :v1 do
      resources :auctions

      namespace :auth do
        post '/upload_avatar', to: 'users#upload_avatar'
        get '/get_bids', to: 'bid_details#get_bids'
        resources :users, only: :update
        resources :auctions do
          get :bid_detail, on: :member
        end
        resources :bid_details, only: :create
      end
    end
  end  
end
