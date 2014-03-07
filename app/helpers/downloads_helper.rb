module DownloadsHelper

	def item_download_path(item)
		if current_user && current_user.paid_items.include?(item)
			if item.downloads.size == 1
				item.downloads.first.file.url
			else
				profile_path
			end
		else
			item_path(item)
		end
	end
	
end
