class CartController < ApplicationController
  before_filter :load_cart

  def add
    item = Item.find(params[:id])
    @cart.add(item)
    redirect_to view_cart_path, notice: "#{item.name} #{t('was_added_to_your_cart')}."
  end
  
  def remove
    line_item = @cart.remove(params[:id])
    redirect_to view_cart_path, notice: "#{line_item.item_name} #{t('was_removed_from_your_cart')}."
  end

  def update
    @cart.update_attributes(cart_params)
    redirect_to view_cart_path, notice: t('your_cart_was_updated')  
  end

  def view
  end

  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def cart_params
      params.require(:cart).permit(line_items_attributes: [:quantity, :id])
    end

end
