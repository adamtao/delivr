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
	validate  :belongs_to_a_category

	accepts_nested_attributes_for :images,    reject_if: :all_blank
	accepts_nested_attributes_for :downloads, reject_if: :all_blank
	accepts_nested_attributes_for :documents, reject_if: :all_blank
	accepts_nested_attributes_for :category_items, reject_if: :all_blank

	after_save :update_category_activations

	def thumbnail
		@thumbnail ||= images.where(role: "thumbnail").first || images.first
	end

	def main_image
		@main_image ||= images.where(role: "main").first || images.first
	end

	def update_category_activations
		categories.each{|c| c.save}
	end

	def belongs_to_a_category
		errors.add(:name, "must belong to at least one category.") unless categories.size > 0
	end

end
