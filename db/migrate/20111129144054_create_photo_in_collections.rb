class CreatePhotoInCollections < ActiveRecord::Migration
  def change
    create_table :photo_in_collections, :id => false do |t|
      t.string :uuid, :limit => 36, :primary => true
      
      t.references :collection
      t.references :photo

      t.timestamps
    end
    add_index :photo_in_collections, :collection_id
    add_index :photo_in_collections, :photo_id
  end
end
