json.array!(@cash_terminals) do |cash_terminal|
  json.extract! cash_terminal, :id
  json.url cash_terminal_url(cash_terminal, format: :json)
end
