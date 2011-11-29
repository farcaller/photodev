class CollectionsController < ApplicationController
  load_and_authorize_resource :through => :current_user, :only => [:index, :new, :edit, :create, :update, :destroy]
  load_and_authorize_resource :only => :show

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
  
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to new_user_session_url, :alert => 'You must sign in to manage collections'
  end
end
