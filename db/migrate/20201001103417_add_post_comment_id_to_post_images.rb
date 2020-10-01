class AddPostCommentIdToPostImages < ActiveRecord::Migration[5.2]
  def change
    add_column :post_images, :post_comment_id, :integer
  end
end
