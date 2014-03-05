class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name
      t.text :description
      t.string :header_image_file_name
      t.string :header_image_content_type
      t.datetime :header_image_updated_at
      t.integer :header_image_file_size
      t.string :slug

      t.timestamps
    end
    add_index :categories, :slug
  end
end
