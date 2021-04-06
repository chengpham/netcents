Rails.application.routes.draw do
  post "/login", to: "auth#login"
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      get '/bitcoins' => 'bitcoins#index'
    end
  end
end
