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

  # Listing Routes
  get '/listing/edit' => 'listing#edit'
  patch '/listing/edit' => 'listing#update'
  delete '/listing/destroy' => 'listing#destroy'
  get 'listing/index' => 'listing#index'
  get '/listing/show_mine' => 'listing#show_mine'
  get '/listing/show' => 'listing#show'
  get '/listing/new' => 'listing#new'
  post '/listing/new' => 'listing#create'

  # User Routes
  get '/users/show' => 'users#show'
  get '/users/edit_profile' => 'users#edit_profile'
  patch '/users/edit_profile' => 'users#update'

  # Listing Review Routes
  get 'listing/review/new' => 'listing_review#new'
  post 'listing/review/new' => 'listing_review#create'

  resources :listing_review do
    member do
      put "like", to: "listing_review#upvote"
      put "dislike", to:"listing_review#downvote"
    end
  end

  # Listing Request Routes
  get 'listing/request/new' => 'listing_request#new'
  post 'listing/request/new' => 'listing_request#create'
  get 'listing/request/show_for_listing' => 'listing_request#show_for_listing'
  get 'listing/request/show_requests_to_me' => 'listing_request#show_requests_to_me'
  get 'listing/request/show_my_requests' => 'listing_request#show_my_requests'
  delete 'listing/request/destroy' => 'listing_request#destroy'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
