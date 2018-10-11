Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  root 'landing#index'
  get 'landing/index'

  #get '/preferences' => 'preferences#create'
  get '/preferences' => 'preferences#new'
  post '/preferences' => 'preferences#create'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
