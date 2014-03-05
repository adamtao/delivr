json.array!(@items) do |item|
  json.extract! item, :id, :name, :slug, :description, :price_cents
  json.url item_url(item, format: :json)
end
