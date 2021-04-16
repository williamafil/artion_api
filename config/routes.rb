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
      end
    end
  end  
end
