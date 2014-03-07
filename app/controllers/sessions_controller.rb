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

end
