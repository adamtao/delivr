class SupportMessage < ActiveRecord::Base
	after_save :send_message
	
	validates :name,  presence: true
	validates :email, presence: true
	validates :subject, presence: true
	validates :message, presence: true

	def send_message
		ShopMailer.support_form(self).deliver
	end
end
