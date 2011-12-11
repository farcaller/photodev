class ApplicationController < ActionController::Base
  protect_from_forgery
  
  def current_photostream
    current_user.photostream if current_user
  end
  
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to new_user_session_url, :alert => exception.message
  end
  
  unless Rails.application.config.consider_all_requests_local
    rescue_from ActiveRecord::RecordNotFound, :with => :render_404
    rescue_from Exception, :with => :render_500
  end

  private
  def render_404
    render :template => 'error_pages/404', :layout => true, :status => :not_found
  end
  
  def render_500
    render :template => 'error_pages/404', :layout => true, :status => :internal_server_error
  end
end
