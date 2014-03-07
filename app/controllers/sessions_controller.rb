class SessionsController < ApplicationController

  def new
  end

  def create
    auth = request.env["omniauth.auth"]
    user = User.where(:provider => auth['provider'],
                      :uid => auth['uid'].to_s).first || User.create_with_omniauth(auth)
    # Reset the session after successful login, per
    # 2.8 Session Fixation – Countermeasures:
    # http://guides.rubyonrails.org/security.html#session-fixation-countermeasures
    cart_id = session[:cart_id]
    cart = Cart.find(cart_id) if cart_id
    reset_session
    session[:user_id] = user.id
    session[:cart_id] = cart_id
    if user.email.blank?
      redirect_to edit_profile_path, :alert => t('please_enter_email')
    elsif cart_id && !cart.empty?
      redirect_to checkout_url, notice: t('signed_in')
    else
      redirect_to root_url, :notice => t('signed_in')
    end

  end

  def destroy
    reset_session
    redirect_to root_url, :notice => t('signed_out')
  end

  def failure
    redirect_to root_url, :alert => "Authentication error: #{params[:message].humanize}"
  end

  def forgot_password
    if request.post?
      user = User.where(email: params[:email]).first_or_initialize
      if user.new_record?
        redirect_to forgot_password_path, alert: t('no_account_found')
      elsif user.provider == "identity"
        redirect_to forgot_password_path, notice: t('check_email_for_password_reset')
        user.send_password_reset
      else
        redirect_to new_session_path, notice: t('your_account_was_registered_via', provider: user.provider)
      end
    end
  end

  def reset_password
    @identity = Identity.where(password_reset_digest: params[:password_reset_digest]).first_or_initialize
    if @identity.new_record?
      redirect_to forgot_password_path, alert: "Sorry, something went wrong resetting your password. Try again."
    elsif request.post?
      if @identity.update!(params.require(:identity).permit(:password, :password_confirmation))
        @identity.password_reset_digest = nil
        @identity.save
        redirect_to new_session_path, notice: "#{t('password_is_reset')} #{t('sign_in_to_continue')}"
      end
    end
  end

end
