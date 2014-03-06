class CategoryItem < ActiveRecord::Base
	belongs_to :item, inverse_of: :category_items 
	belongs_to :category, touch: true

	validates :item, presence: true
	validates :category_id, presence: true, uniqueness: { scope: :item_id }
end
