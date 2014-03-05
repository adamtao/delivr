class Category < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: [:slugged, :finders]

	has_many :category_items, dependent: :destroy
	has_many :items, through: :category_items

	validates :name, presence: true

	# TODO: assess image size needs
  has_attached_file :header_image, 
    styles: { lightbox: "800x600",
      large: "640x480", 
      medium: "480x360", 
      banner: "1100x300",
      horiz_medium: "670x275",
      vert_medium: "375x400",
      medium_small: "150x225",
      small: "240x180",
      horiz_thumb: "170x80",
      thumb: "100x100", 
      tiny: "64x64", 
      tiny_square: "64x64#" 
    }

  def active_items
  	items.where(active: true)
  end
end
