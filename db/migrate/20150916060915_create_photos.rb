class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :image
      t.integer :user_id
      t.string :image_file_name
      t.string :image_content_type
      t.integer :image_file_size
      t.string :content

      t.timestamps null: false
    end
  end
end
