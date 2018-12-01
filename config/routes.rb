Rails.application.routes.draw do
  get 'home/index'
  resources :owners
  devise_for :users
	 root to: "home#index"

  get "/search" => "search#index"
  get "/search/parking_lot" => "search#parking_lot"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
