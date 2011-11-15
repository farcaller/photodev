Photodev::Application.routes.draw do
  resource :photostream, :only => [:show]

  devise_for :users

  root :to => 'home#index'
end
