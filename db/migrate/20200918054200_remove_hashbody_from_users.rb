class RemoveHashbodyFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :hashbody, :text
  end
end
