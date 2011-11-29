class CollectionsController < ApplicationController
  load_and_authorize_resource
  
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
    if exception.action == :show and exception.subject.user != current_user
      redirect_to root_url, :alert => 'You cannot access this collection'
    else
      redirect_to new_user_session_url, :alert => 'You must sign in to access collections'
    end
  end
end
