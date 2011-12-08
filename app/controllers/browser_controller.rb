class BrowserController < ApplicationController
  def show
    @photo_in_collection = PhotoInCollection.where(:collection_id => params[:collection_id]).find(params[:uuid])
    # TODO auth
    @photo = @photo_in_collection.photo
  end

end
