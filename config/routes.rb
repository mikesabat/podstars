Rails.application.routes.draw do
  resources :episodes
  resources :podcasts do
  	# get :lookup
  end
  resources :stars
  get '/lookup', :to => 'lookups#new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'stars#index'
end
