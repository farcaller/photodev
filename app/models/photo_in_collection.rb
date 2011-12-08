class PhotoInCollection < ActiveRecord::Base
  include Extensions::UUID
  delegate :url_helpers, to: 'Rails.application.routes'
  
  belongs_to :collection
  belongs_to :photo
  
  acts_as_list :scope => :collection
  
  before_save :update_position_if_changed
  
  def url
    url_helpers.collection_contained_photo_path(self.collection, self)
  end
  
  private
  def update_position_if_changed
    if position_changed? and position_was
      self.class.update_all "position = (position - 1)", "#{scope_condition} AND position > #{position_was}"
      self.class.update_all "position = (position + 1)", "#{scope_condition} AND position >= #{position}"
    end
  end
end
