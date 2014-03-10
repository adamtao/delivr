module CheckoutHelper

	def sales_order_download_path(sales_order)
		if sales_order.line_items.size == 1
			quick_item_download_path(sales_order.line_items.first.item)
		else
			profile_path
		end
	end
end
