json.array!(@credit_types) do |credit_type|
  json.extract! credit_type, :id
  json.url credit_type_url(credit_type, format: :json)
end
