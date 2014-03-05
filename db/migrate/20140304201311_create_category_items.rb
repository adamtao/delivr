class CreateCategoryItems < ActiveRecord::Migration
  def change
    create_table :category_items do |t|
      t.integer :item_id
      t.integer :category_id

      t.timestamps
    end
    add_index :category_items, :item_id
    add_index :category_items, :category_id
  end
end
