Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  root 'landing#index'
  get 'landing/index'

  # Preferences Routes
  get '/preferences/show' => 'preferences#show'
  get '/preferences/new' => 'preferences#new'
  post '/preferences/new' => 'preferences#create'
  get '/preferences/edit' => 'preferences#edit'
  patch '/preferences/edit' => 'preferences#update'

  get '/listing' => 'listing#new'
  post '/listing' => 'listing#create'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
