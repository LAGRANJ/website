json.array!(@special_offers) do |special_offer|
  json.extract! special_offer, :id
  json.url special_offer_url(special_offer, format: :json)
end
