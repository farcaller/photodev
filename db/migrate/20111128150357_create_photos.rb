class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :title
      t.string :image
      t.references :photostream

      t.timestamps
    end
  end
end
