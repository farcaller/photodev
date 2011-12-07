class PhotoInCollection < ActiveRecord::Base
  include Extensions::UUID
  
  belongs_to :collection
  belongs_to :photo
end
