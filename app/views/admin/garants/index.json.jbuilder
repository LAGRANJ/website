json.array!(@garants) do |garant|
  json.extract! garant, :id
  json.url garant_url(garant, format: :json)
end
