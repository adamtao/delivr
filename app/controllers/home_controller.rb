class HomeController < ApplicationController
	def index
		# may want to have an actual homepage, if not, jump to the categories
		redirect_to categories_path
	end

	def support
		@support_message = SupportMessage.new
		if request.post?
			safe_params = params.require(:support_message).permit(:name, :email, :subject, :message)
			@support_message = SupportMessage.new(safe_params)
			if @support_message.save
				redirect_to root_path, notice: t('contact_form_success')
			end
		end
	end

  # Generates sitemap.xml
  def sitemap
    @pages = []
    @pages << { 
    	url: root_url,
      updated_at: 1.day.ago,
      changefreq: 'daily',
      priority: 0.7 
    }
    Category.all.each do |category|
    	category.active_items.each do |item|
    		@pages << {
		    	url: url_for(item),
		      updated_at: item.updated_at,
		      changefreq: 'weekly',
		      priority: 0.9 
    		}
    	end
    end
  end

  # Generates robots.txt
  def robots
  end

end
