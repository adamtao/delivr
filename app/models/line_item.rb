class LineItem < ActiveRecord::Base
	belongs_to :cart
	belongs_to :item

	monetize :unit_price_cents
  monetize :total_cents

	validates :cart_id,  presence: true
	validates :item_id,  presence: true, uniqueness: { scope: :cart_id }
	validates :quantity, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
	validates :unit_price_cents, presence: true, numericality: true

  after_save :remove_empty_line

  # The total for a give LineItem (quantity * price)
  def total_cents
  	quantity * unit_price_cents
  end

  # Clean up LineItems with zero quantity
  def remove_empty_line
  	self.destroy if self.quantity.to_i < 1
  end

end
