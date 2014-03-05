class Download < ActiveRecord::Base
	belongs_to :item

	validates :item_id, presence: true
	validates :name, presence: true
	validates :file_file_name, presence: true

  has_attached_file :file, {
    url: "/system/:hash.:extension",
    hash_secret: ENV['SECRET_KEY_BASE'],
	  path: ":rails_root/../../shared/protected/:class/:attachment/:id_:timestamp/:basename.:extension"

end
