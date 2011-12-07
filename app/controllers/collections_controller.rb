class CollectionsController < ApplicationController
  load_and_authorize_resource :through => :current_user, :only => [:index, :new, :edit, :create, :update, :destroy]
  load_and_authorize_resource :id_param => :collection_id, :through => :current_user, :only => [:append_photos, :remove_photos]
  load_and_authorize_resource :only => [:show]
  
  respond_to :html, :json
  
  def index
    respond_with(@collections)
  end
  
  def show
    respond_to do |format|
      format.html { @collection }
      format.json { render json: @collection }
    end
  end
  
  def create
    if @collection.save
      redirect_to collection_url(@collection), :notice => 'Collection was successfully created.'
    else
      render :action => "new"
    end
  end

  def update
    if @collection.update_attributes(params[:collection])
      redirect_to @collection, :notice => 'Collection was successfully updated.'
    else
      render :action => "edit"
    end
  end

  def destroy
    @collection.destroy

    redirect_to collections_url
  end
  
  def append_photos
    photos = Photo.where(:photostream_id => current_photostream).find(params[:photo_ids])
    photos.each do |photo|
      if not @collection.photos.include?(photo)
        @collection.photos << photo
      end
    end
    @collection.save
    
    respond_to do |format|
      format.html { redirect_to @collection }
      format.json { render json: @collection }
    end
  end
  
  def remove_photos
    photo_in_collections = PhotoInCollection.find(params[:photo_ids])
    photo_in_collections.each do |pc|
      if @collection.photo_in_collections.include?(pc)
        @collection.photo_in_collections.delete(pc)
      end
    end
    @collection.save
    
    respond_to do |format|
      format.html { redirect_to @collection }
      format.json { render json: @collection }
    end
  end
  
  rescue_from CanCan::AccessDenied do |exception|
    if exception.action == :show and current_user and exception.subject.user != current_user
      redirect_to root_url, :alert => 'You cannot access this collection'
    else
      redirect_to new_user_session_url, :alert => 'You must sign in to access collections'
    end
  end
end
