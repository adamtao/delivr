class ItemImage < ActiveRecord::Base
	belongs_to :item, touch: true 
	acts_as_list scope: :item_id

	validates :item_id, presence: true

	# TODO: assess image size needs
  has_attached_file :image, 
    styles: { lightbox: "800x600",
      large: "640x480", 
      medium: "480x360", 
      horiz_medium: "670x275",
      epedal: "400x250",
      vert_medium: "375x400",
      medium_small: "150x225",
      small: "240x180",
      horiz_thumb: "170x80",
      thumb: "100x100", 
      tiny: "64x64", 
      tiny_square: "64x64#" 
    }


end
