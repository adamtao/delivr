class ItemDocument < ActiveRecord::Base
  belongs_to :item, touch: true, inverse_of: :documents
  validates :item, presence: true

  has_attached_file :document
  validates_attachment :document, presence: true
  do_not_validate_attachment_file_type :document

end
