class CreateDownloads < ActiveRecord::Migration
  def change
    create_table :downloads do |t|
      t.string :name
      t.integer :item_id
      t.string :file_file_name
      t.string :file_content_type
      t.integer :file_file_size
      t.datetime :file_updated_at

      t.timestamps
    end
    add_index :downloads, :item_id
  end
end
