class AddRowToUsers < ActiveRecord::Migration
  def change
    add_column :users, :marker, :json
  end
end
