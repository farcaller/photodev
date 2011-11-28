class Photo < ActiveRecord::Base
  belongs_to :photostream
  
  attr_accessible :title, :image
  mount_uploader :image, PhotoUploader
  
  validates :image, :presence => true
  
end
