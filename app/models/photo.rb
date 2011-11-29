class Photo < ActiveRecord::Base
  belongs_to :photostream
  has_many :photo_in_collections, :dependent => :destroy
  has_many :collections, :through => :photo_in_collections
  
  attr_accessible :title, :image
  mount_uploader :image, PhotoUploader
  
  validates :image, :presence => true
  
end
