class CreateItemImages < ActiveRecord::Migration
  def change
    create_table :item_images do |t|
      t.integer :item_id
      t.string :image_file_name
      t.integer :image_file_size
      t.string :image_content_type
      t.datetime :image_updated_at
      t.string :role
      t.integer :position

      t.timestamps
    end
    add_index :item_images, :item_id
    add_index :item_images, :role
  end
end
