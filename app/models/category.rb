class Category < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: [:slugged, :finders]

	has_many :category_items, dependent: :destroy
	has_many :items, through: :category_items

	validates :name, presence: true

  has_attached_file :header_image, 
    styles: { 
      large_banner:  "1000x200#",
      medium_banner: "800x160#", 
      small_banner:  "400x80#",
      thumb:    "100x100", 
      tiny:     "64x64", 
      tiny_square: "64x64#" 
    }

  validates_attachment_content_type :header_image, content_type: /\Aimage/i

  before_update :count_active_items

  def active_items
  	items.where(active: true)
  end

  def count_active_items
    self.active = active_items.count > 0
    true
  end

end
