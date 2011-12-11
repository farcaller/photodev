Photodev::Application.routes.draw do
  resource :photostream, :only => [:show]
  resources :photos, :only => [:new, :create]
  resources :collections do
    post :append_photos
    post :remove_photos
    match 'photo/:uuid', to: 'collections#reorder_photo', as: 'reorder_photo', via: :put,
          constraints: {:id => /[a-f0-9]{8}-[a-f0-9]{4}-4[a-f0-9]{3}-[a-f0-9]{4}-[a-f0-9]{12}/}
    
    match 'photo/:uuid', to: 'browser#show', as: 'contained_photo', via: :get,
          constraints: {:id => /[a-f0-9]{8}-[a-f0-9]{4}-4[a-f0-9]{3}-[a-f0-9]{4}-[a-f0-9]{12}/}
  end
  
  if Rails.env.production?
    devise_for :users, :controllers => { :registrations => "registrations" } 
  else
    devise_for :users
  end

  root :to => 'home#index'
end
