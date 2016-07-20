json.array!(@newsitems) do |newsitem|
  json.extract! newsitem, :id, :caption, :body, :creation_date, :priority
  json.url newsitem_url(newsitem, format: :json)
end
