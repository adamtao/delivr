class CheckoutController < ApplicationController
  before_filter :authenticate_user!
  before_filter :load_cart
  before_filter :load_sales_order, except: :order_confirmation

  def index
    @page_title = t('checkout').capitalize
  end

  def finalize
    if @sales_order.update_attributes(params.require(:sales_order).permit(:stripe_card_token))
      if @sales_order.save_with_payment
        redirect_to order_confirmation_path(@sales_order), notice: t('checkout_complete') and return
      else
        redirect_to checkout_path, alert: t('order_submit_problem') and return
      end
    else
      redirect_to checkout_path, alert: t('order_prepare_problem') and return
    end
  end

  def order_confirmation
    session[:cart_id] = nil
    @sales_order = SalesOrder.find(params[:id])
    unless @sales_order.user_id == current_user.id
      redirect_to root_path
    end
  end

  private

  def load_sales_order
    @sales_order ||= @cart.get_or_create_sales_order
    @sales_order.assign_to(current_user)
  end
end
