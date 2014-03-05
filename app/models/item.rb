class Item < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: [:slugged, :finders]
	monetize :price_cents

	has_many :category_items, dependent: :destroy, inverse_of: :item
	has_many :categories, through: :category_items
	has_many :downloads
	has_many :documents, :class_name => "ItemDocument"
	has_many :images, -> { order('position') }, :class_name => "ItemImage"

	validates :name, presence: :true

	accepts_nested_attributes_for :images, reject_if: :all_blank
	accepts_nested_attributes_for :category_items, reject_if: :all_blank
	#TODO: validate item belongs to at least one category

	def thumbnail
		images.where(role: "thumbnail").first
	end
end
