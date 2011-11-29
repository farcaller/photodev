class PhotosController < ApplicationController
  def new
    redirect_to(new_user_session_path, :notice => 'You must sign in to upload photos.') and return if not user_signed_in?
    @photo = current_photostream.photos.build
  end

  def create
    redirect_to(new_user_session_path, :notice => 'You must sign in to upload photos.') and return if not user_signed_in?
    @photo = current_photostream.photos.build(params[:photo])

    if @photo.save
      redirect_to photostream_url, :notice => 'Photo was successfully created.'
    else
      render :action => "new"
    end
  end

end
