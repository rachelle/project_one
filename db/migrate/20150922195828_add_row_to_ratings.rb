class AddRowToRatings < ActiveRecord::Migration
  def change
    add_column :ratings, :user_id, :string
    add_column :ratings, :review_id, :string
    add_column :ratings, :photo_id, :string
  end
end
