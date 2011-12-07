class BrowserController < ApplicationController
  def show
    @photo_in_collection = PhotoInCollection.find(params[:uuid])
    # TODO auth
    # TODO check if collection_id matches
    @photo = @photo_in_collection.photo
  end

end
