class Collection < ActiveRecord::Base
  belongs_to :user
  has_many :photo_in_collections, :dependent => :destroy
  has_many :photos, :through => :photo_in_collections
end
