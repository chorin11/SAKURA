class RemoveShopFromPostImages < ActiveRecord::Migration[5.2]
  def change
    remove_column :post_images, :shop, :string
  end
end
