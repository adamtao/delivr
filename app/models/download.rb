class Download < ActiveRecord::Base
	belongs_to :item

	validates :item_id, presence: true
	validates :name, presence: true
	validates :file_file_name, presence: true

  has_attached_file :file # TODO: store outside of rails' public folder

end
