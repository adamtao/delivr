class ItemImage < ActiveRecord::Base
	belongs_to :item, touch: true, inverse_of: :images
  validates :item, presence: true
	acts_as_list scope: :item_id

  has_attached_file :image, 
    styles: { 
      lightbox: "800x600",
      large:    "640x480", 
      medium:   "400x320", 
      small:    "320x240",
      smaller:  "240x180",
      thumb:    "100x100", 
      tiny:     "64x64", 
      tiny_square: "64x64#" 
    }

  validates_attachment :image, presence: true, content_type: { content_type: /\Aimage/i }

end
