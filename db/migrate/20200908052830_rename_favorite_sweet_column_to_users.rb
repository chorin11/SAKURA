class RenameFavoriteSweetColumnToUsers < ActiveRecord::Migration[5.2]
  def change
    rename_column :users, :favorite_sweet, :favorite_sweets
  end
end
