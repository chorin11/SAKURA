class AddUsersToHashbody < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :hashbody, :text
  end
end
