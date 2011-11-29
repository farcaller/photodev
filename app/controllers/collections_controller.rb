class CollectionsController < ApplicationController
  def index
    @collections = current_user.collections.all
  end

  def show
    @collection = current_user.collections.find(params[:id])
  end

  def new
    @collection = current_user.collections.build
  end

  def edit
    @collection = current_user.collections.find(params[:id])
  end

  def create
    @collection = current_user.collections.build(params[:collection])

    if @collection.save
      redirect_to collection_url(@collection), :notice => 'Collection was successfully created.'
    else
      render :action => "new"
    end
  end

  def update
    @collection = current_user.collections.find(params[:id])

    if @collection.update_attributes(params[:collection])
      redirect_to @collection, :notice => 'Collection was successfully updated.'
    else
      render :action => "edit"
    end
  end

  def destroy
    @collection = Collection.find(params[:id])
    @collection.destroy

    redirect_to collections_url
  end
end
