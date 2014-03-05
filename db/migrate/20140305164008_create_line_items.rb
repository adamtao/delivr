class CreateLineItems < ActiveRecord::Migration
  def change
    create_table :line_items do |t|
      t.integer :cart_id
      t.integer :quantity
      t.money :unit_price
      t.integer :item_id

      t.timestamps
    end
    add_index :line_items, :cart_id
  end
end
