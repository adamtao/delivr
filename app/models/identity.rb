class Identity < OmniAuth::Identity::Models::ActiveRecord
	validates :name, presence: true
	validates :email, presence: true, format: /\A[-a-z0-9_+\.]+\@([-a-z0-9]+\.)+[a-z0-9]{2,4}\z/i

	def send_password_reset
		self.generate_password_reset_digest!
		AccountMailer.password_reset(self).deliver
	end

	def generate_password_reset_digest!
    self.password_reset_digest = loop do
      random_token = SecureRandom.urlsafe_base64(nil, false)
      break random_token unless Identity.exists?(password_reset_digest: random_token)
    end
    save
  end

end
