class CreatePostComments < ActiveRecord::Migration[5.2]
  def change
    create_table :post_comments do |t|
      t.integer :user_id
      t.integer :post_image_id
      t.string :post_comment
      t.datetime :created_at
      t.datetime :update_at

      t.timestamps
    end
  end
end
