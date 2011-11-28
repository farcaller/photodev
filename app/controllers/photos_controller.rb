class PhotosController < ApplicationController
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

end
