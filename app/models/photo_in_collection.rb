class PhotoInCollection < ActiveRecord::Base
  include Extensions::UUID
  delegate :url_helpers, to: 'Rails.application.routes'
  
  belongs_to :collection
  belongs_to :photo
  
  def url
    url_helpers.collection_contained_photo_path(self.collection, self)
  end
end
