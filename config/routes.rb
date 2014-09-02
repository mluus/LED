# Rails.application.routes.draw do
#   devise_for :users
#   root "rentees#index"

#   # resources :engineers

#   resources :rentees do
#     resources :engineers
#     member do
#       patch 'add_token'

#     end
#   end
# end
Rails.application.routes.draw do
  devise_for :users
  root "rentees#index"


  resources :rentees do
    member do
      patch 'add_token'
    end
    resources :engineers
  end
end