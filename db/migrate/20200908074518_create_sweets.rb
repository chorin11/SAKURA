class CreateSweets < ActiveRecord::Migration[5.2]
  def change
    create_table :sweets do |t|
      t.string :sweets_name
      t.string :sweets_introduction
      t.integer :genre_id
      t.string :season

      t.timestamps
    end
  end
end
