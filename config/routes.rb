Rails.application.routes.draw do
  resources :episodes
  resources :podcasts do
  	# get :lookup
  end
  resources :stars
  get '/lookup', :to => 'lookups#new'
  post '/lookup', :to => 'lookups#catch'
  # get '/catch', :to => 'lookups#catch'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'stars#index'
end
