module ApplicationHelper

  # Using zurb foundation to show the given ItemImage. Provide:
  #
  #   * ItemImage object
  #   * default_size -> paperclip style to use for the default image
  #   * sizes -> a hash of sizes (used in the media query) and the paperclip style to be used.
  #
  # A default set of small, medium, large sizes is provided. So, if your
  # paperclip attachment has :small, :medium, :large, and you want to use them, then
  # nothing else is needed. Otherwise, pass a hash like this:
  #
  #   small: 'thumbnail', medium: 'medium', large: 'banner'
  #
  def interchange_image(image, default_size, sizes={})
  	default_sizes = {large: :large, medium: :medium, small: :small}
  	sizes = default_sizes.merge sizes

    q = []
    q << "[#{ image.image.url(default_size) }, (default)]"

    sizes.each do |size, paperclip_style|
    	media_query = size.to_s
    	media_query = "only screen and (max-width: 600px)" if (size == :small)
    	media_query = "only screen and (max-width: 1023px)" if (size == :medium)
    	media_query = "only screen and (min-width: 1024px)" if (size == :large)
   		q << "[#{ image.image.url(paperclip_style) }, (#{media_query})]"
    end

    image_tag(image.image.url(default_size), 
      class: "no-resize no-resize-for-small",
      data: { interchange: q.join(", ") })
  end

end
