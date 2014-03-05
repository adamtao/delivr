json.array!(@item_documents) do |item_document|
  json.extract! item_document, :id, :item_id, :document_file_name, :document_content_type, :document_file_size, :document_updated_at
  json.url item_document_url(item_document, format: :json)
end
