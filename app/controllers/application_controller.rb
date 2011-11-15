class ApplicationController < ActionController::Base
  protect_from_forgery
  
  def current_photostream
    current_user.photostream if current_user
  end
end
