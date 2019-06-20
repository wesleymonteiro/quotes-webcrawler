Rails.application.routes.draw do
  devise_for :users
  
  namespace :api do
    namespace :v1 do
      resource :users do
        get :login
        post :sign_in
      end

      get "quotes/:tag", action: :search, controller: "quotes"
    end
  end   
end
