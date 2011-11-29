class PhotosController < ApplicationController
  before_filter :authorize_user_for_photos
  
  def new
    @photo = current_photostream.photos.build
  end

  def create
    @photo = current_photostream.photos.build(params[:photo])

    if @photo.save
      redirect_to photostream_url, :notice => 'Photo was successfully created.'
    else
      render :action => "new"
    end
  end

  protected
  def authorize_user_for_photos
    redirect_to(new_user_session_path, :notice => 'You must sign in to upload photos.') and return unless user_signed_in?
  end
end
