class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string :content
      t.string :user_id
      t.string :photo_id
      t.string :emoji

      t.timestamps null: false
    end
  end
end
