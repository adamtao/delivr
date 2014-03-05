class CreateSalesOrders < ActiveRecord::Migration
  def change
    create_table :sales_orders do |t|
      t.integer :cart_id
      t.integer :user_id
      t.string :stripe_charge_id
      t.money :tax
      t.string :ip_address

      t.timestamps
    end
    add_index :sales_orders, :cart_id
    add_index :sales_orders, :user_id
  end
end
