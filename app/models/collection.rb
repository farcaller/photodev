class Collection < ActiveRecord::Base
  belongs_to :user
  has_many :photo_in_collections, :dependent => :destroy
  has_many :photos, :through => :photo_in_collections
  
  attr_accessible :title, :public
  
  validates :title, :public, :presence => true
end
