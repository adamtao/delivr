class AccountMailer < ActionMailer::Base
  default from: ENV['DEFAULT_FROM']

  def password_reset(identity)
    @identity = identity
    mail to: identity.email, 
      subject: I18n.t('account_mailer.password_reset.subject', site: ENV['SITE_NAME'])
  end

  def welcome(user)
  	@user = user
    if @user.email?
      mail to: @user.email,
        subject: I18n.t('account_mailer.welcome.subject', site: ENV['SITE_NAME'])
    end
  end

end
