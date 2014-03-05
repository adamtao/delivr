class CreateItemDocuments < ActiveRecord::Migration
  def change
    create_table :item_documents do |t|
      t.integer :item_id
      t.string :document_file_name
      t.string :document_content_type
      t.integer :document_file_size
      t.datetime :document_updated_at

      t.timestamps
    end
    add_index :item_documents, :item_id
  end
end
