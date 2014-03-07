class User < ActiveRecord::Base
  rolify
  validates :name, presence: true
  validates :email, presence: true, format: /\A[-a-z0-9_+\.]+\@([-a-z0-9]+\.)+[a-z0-9]{2,4}\z/i
  has_many :sales_orders

  after_create :welcome

  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth['provider']
      user.uid = auth['uid']
      if auth['info']
         user.name = auth['info']['name'] || ""
         user.email = auth['info']['email'] || ""
      end
    end
  end

  def welcome
    AccountMailer.welcome(self).deliver
  end

  def items
    @items ||= (paid_items + role_items).uniq
  end

  #TODO: give VIP users extra stuff for free
  def role_items
    []
  end

  def paid_items
    sales_orders.where("stripe_charge_id IS NOT NULL").map{|so| so.items}.flatten
  end

  def send_password_reset
    if self.provider == "identity"
      identity = Identity.find(self.uid)
      identity.send_password_reset
    end
  end

end
