class ProfileController < ApplicationController
	before_filter :authenticate_user!

	def show		
	end

	def edit		
	end

	def update
		respond_to do |format|
			if current_user.update_attributes(safe_params)
				format.html { 
					if session[:cart_id] && current_user.created_at > 10.minutes.ago
						redirect_to checkout_path, notice: t('profile_updated_continue_shopping')
					else
						redirect_to profile_path, notice: t('profile_updated')
					end
				}
			else
				format.html { render action: 'edit' }
			end
		end		
	end

private

	# Setup which params can be passed in via web forms
	#
	def safe_params
		params.require(:user).permit(:name, :email)
	end
end
