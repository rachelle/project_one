class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :username
      t.string :services
      t.string :location
      t.string :business_name
      t.string :password
      t.string :password_digest
      t.string :description
      t.string :avatar
      t.string :avatar_file_name
      t.string :avatar_content_type
      t.integer :avatar_file_size
      t.decimal :lng
      t.decimal :lat
      t.decimal :latlng
      t.string :contact_number

      t.timestamps null: false
    end
  end
end
