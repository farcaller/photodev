class AddPositionToPhotoInCollection < ActiveRecord::Migration
  def change
    add_column :photo_in_collections, :position, :integer
  end
end
