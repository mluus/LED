
Rails.application.routes.draw do
  devise_for :users
  root "rentees#index"




  resources :rentees do
    member do
      patch 'add_token'
    end
    resources :engineers
  end

  put "engineer/associate/:device/to/:password" => "engineers#associate"
  get "engineer/:device" => "engineers#tokenInfo"
  put "engineer/:device" => "engineers#usesToken"

end


