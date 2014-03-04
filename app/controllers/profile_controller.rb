class ProfileController < ApplicationController
	# TODO: ensure user is logged in

	def show		
	end

	def edit		
	end

	def update
		respond_to do |format|
			if current_user.update_attributes(safe_params)
				format.html { redirect_to profile_path, notice: "Your profile was updated."}
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
