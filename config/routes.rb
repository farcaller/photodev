Photodev::Application.routes.draw do
  resource :photostream, :only => [:show]
  resources :photos, :only => [:new, :create]

  devise_for :users

  root :to => 'home#index'
end
