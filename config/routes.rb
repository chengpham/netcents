Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :bitcoins
      resource :session, only: [:create, :destroy]
      get('/current_user', to: 'sessions#get_current_user')
      resources :users, only: [:create]
    end
  end
end
