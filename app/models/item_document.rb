class ItemDocument < ActiveRecord::Base
	belongs_to :item, touch: true, inverse_of: :documents
	validates :item, presence: true

  has_attached_file :document
  validates_attachment :document, presence: true, content_type: { content_type: /word|doc|pdf|txt|text|image/i }

end
