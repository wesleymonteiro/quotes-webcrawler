Rails.application.routes.draw do
  devise_for :users
  
  namespace :api do
    namespace :v1 do
      get "quotes/:tag", action: :search, controller: "quotes"
    end
  end   
end
