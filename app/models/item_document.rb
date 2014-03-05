class ItemDocument < ActiveRecord::Base
	belongs_to :item, touch: true
	validates :item_id, presence: true
  has_attached_file :document

end
