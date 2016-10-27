json.array!(@deposit_types) do |deposit_type|
  json.extract! deposit_type, :id
  json.url deposit_type_url(deposit_type, format: :json)
end
