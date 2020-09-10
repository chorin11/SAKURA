class RemoveUpdateAtFromPostComments < ActiveRecord::Migration[5.2]
  def change
    remove_column :post_comments, :update_at, :datetime
  end
end
