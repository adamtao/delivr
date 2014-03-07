class Download < ActiveRecord::Base
	belongs_to :item, inverse_of: :downloads

	validates :item, presence: true
	validates :name, presence: true
	validates :file_file_name, presence: true

  has_attached_file :file, 
    url: '/downloads/:id/download',
	path: ":rails_root/../../shared/protected/:class/:attachment/:id_:timestamp/:basename.:extension"

	validates :file, attachment_presence: true
	do_not_validate_attachment_file_type :file

	def increment_counter
		self.counter ||= 0
		self.counter += 1
		save
	end
end
