Photodev::Application.routes.draw do
  resource :photostream, :only => [:show]
  resources :photos, :only => [:new, :create]
  resources :collections do
    post :append_photos
    post :remove_photos
  end

  devise_for :users

  root :to => 'home#index'
end
