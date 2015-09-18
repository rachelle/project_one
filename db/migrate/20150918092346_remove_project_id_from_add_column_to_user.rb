class RemoveProjectIdFromAddColumnToUser < ActiveRecord::Migration
  def change
    remove_column :users, :contact_number, :string
  end
end
