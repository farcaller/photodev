class CreatePhotostreams < ActiveRecord::Migration
  def change
    create_table :photostreams do |t|
      t.references :user, :null => false
      t.timestamps
    end
    
    add_index :photostreams, :user_id, :unique => true
  end
end
