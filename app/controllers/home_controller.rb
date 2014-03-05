class HomeController < ApplicationController
	def index
		# may want to have an actual homepage, if not, jump to the categories
		redirect_to categories_path
	end
end
