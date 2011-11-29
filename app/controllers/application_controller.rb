class ApplicationController < ActionController::Base
  protect_from_forgery
  
  def current_photostream
    current_user.photostream if current_user
  end
  
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to new_user_session_url, :alert => exception.message
  end
end
