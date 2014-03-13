class ShopMailer < ActionMailer::Base
  default from: ENV['DEFAULT_FROM']

  def order_confirmation(sales_order)
    @sales_order = sales_order
    @user = @sales_order.user
    if @user.email?
      mail to: @user.email,
        subject: I18n.t('shop_mailer.order_confirmation.subject', site: ENV['SITE_NAME'], order: sales_order.order_number)
    end
  end

  def support_form(support_message)
	@support_message = support_message
	mail to: ENV['SUPPORT_EMAIL'], subject: @support_message.subject	
  end
end
