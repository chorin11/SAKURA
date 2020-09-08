class CreatePostImages < ActiveRecord::Migration[5.2]
  def change
    create_table :post_images do |t|
      t.string :shop
      t.string :introduction
      t.integer :user_id
      t.integer :image_id

      t.timestamps
    end
  end
end
