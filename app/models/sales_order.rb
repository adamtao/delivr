class SalesOrder < ActiveRecord::Base
  include ActionView::Helpers::NumberHelper
  
  attr_accessor :stripe_card_token

  belongs_to :cart
  belongs_to :user
  has_many :line_items, through: :cart
  has_many :items, through: :line_items

  monetize :tax_cents
  monetize :subtotal_cents
  monetize :grand_total_cents
  monetize :stripe_fee_cents
  monetize :net_total_cents

  validates :cart_id, presence: true, uniqueness: true

  # Checks if the order is valid and sends a payment request using
  # the token received by Stripe.com's javascript. Sends the payment
  # request using the Stripe.com gem.
  def save_with_payment
    purchase_with_stripe
  end

  # Calculates the total cost of LineItems only
  def subtotal_cents
    cart.subtotal_cents
  end

  # The grand total in cents--used for the stripe payment
  def grand_total_cents
    subtotal_cents + tax_cents
  end

  # Determines if the SalesOrder has been paid for
  def paid?
    self.stripe_charge_id.present?
  end

  # Formats a nice order number:
  def order_number
    self.new_record? ? '--' : "##{ENV['SITE_NAME'].match(/^\w{3}/).to_s.upcase}#{'%06d' % self.id}" 
  end

  # TODO: determine what stripe's fee is via the API? Not sure if it is possible.
  # For now, it is 2.9% plus 30¢
  def stripe_fee_cents
    (0.029 * grand_total_cents) + 30
  end

  def net_total_cents
    grand_total_cents - stripe_fee_cents
  end

  def summary
    "#{order_number} (#{user.name}, #{number_to_currency(grand_total)} #{t('total')} / #{number_to_currency(net_total)} net)"
  end

  # Links this SalesOrder with a User account (the user logged in). 
  def assign_to(user)
  	self.user = user
  end

  private

  def purchase_with_stripe
    if valid?
      begin
        charge = Stripe::Charge.create(stripe_purchase_options)
        self.stripe_charge_id = charge.id
        save!
        ShopMailer.order_confirmation(self).deliver if self.user.email?
      rescue Stripe::InvalidRequestError => e
        logger.error "Stripe error while creating customer: #{e.message}"
        errors.add :base, I18n.t('problem_with_cc')
        false
      end
    end    
  end

  def stripe_purchase_options
    {
      amount: grand_total_cents, 
      currency: "usd",
      card: stripe_card_token, 
      description: "#{ENV['SITE_NAME']} order" 
    } 
  end

end
