class Cart < ActiveRecord::Base
  has_one  :sales_order
  has_many :line_items
  accepts_nested_attributes_for :line_items

  monetize :subtotal_cents

  def get_or_create_sales_order
  	SalesOrder.where(cart_id: self.id).first_or_create
  end

  # Add an item to the cart. Increments the quantity if the item already
  # exists in the cart.
  def add(item)
  	line_item = LineItem.where(cart_id: self.id, item_id: item.id).first_or_initialize
  	if line_item.new_record?
  		line_item.unit_price = item.price
 			line_item.quantity = 1
 		else
 			line_item.quantity += 1
 		end
 		line_item.save!
  end

  # Remove an item from the cart
  def remove(item_id)
  	if line_item = line_items.where(item_id: item_id).first
  		line_item.destroy
  	end
  end

  # Calculates the total cost of LineItems only (no tax)
  def subtotal_cents
  	line_items.inject(0){|total, i| total += i.total_cents}
  end

  # Determines if the cart is empty
  def empty?
  	!!!(self.line_items.size > 0)
  end
end
