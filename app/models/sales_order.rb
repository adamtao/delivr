class SalesOrder < ActiveRecord::Base
  include ActionView::Helpers::NumberHelper
  
  attr_accessor :stripe_card_token

  belongs_to :cart
  belongs_to :user
  has_many :line_items, through: :cart
  has_many :items, through: :line_items
  has_many :transactions, class_name: "SalesOrderTransaction"
  has_many :shipments, order: "created_at DESC"

  monetize :tax_cents

  validates :cart_id, presence: true, uniqueness: true

  # Checks if the order is valid and sends a payment request using
  # the token received by Stripe.com's javascript. Sends the payment
  # request using the Stripe.com gem.
  def save_with_payment
    purchase_with_stripe
  end

  # Calculates the total cost of LineItems only
  def subtotal
    cart.subtotal
  end

  # Sums the LineItems plus the tax amount previously calculated
  def total_with_tax
    subtotal + tax.to_f
  end

  # The grand total in cents--used for the stripe payment
  def grand_total_in_cents
    (total_with_tax * 100).to_i
  end

  # Determines if the cart is empty
  def empty?
    cart.empty?
  end

  # Determines if the SalesOrder has been paid for
  def paid?
    self.stripe_charge_id.present?
  end

  # Formats a nice order number:
  def order_number
    self.new_record? ? '--' : "##{'%06d' % self.id}" 
  end

  # TODO: determine what stripe's fee is
  def net_total
  	stripe_fee = 0.0
    (total_with_tax - stripe_fee)
  end

  def summary
    "#{order_number} (#{user.name}, #{number_to_currency(net_total)} net"
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
      rescue Stripe::InvalidRequestError => e
        logger.error "Stripe error while creating customer: #{e.message}"
        errors.add :base, "There was a problem with your credit card."
        false
      end
    end    
  end

  def stripe_purchase_options
    {
      amount: grand_total_in_cents, 
      currency: "usd",
      card: stripe_card_token, 
      description: "#{ENV['SITE_NAME']} order" 
    } 
  end

end
