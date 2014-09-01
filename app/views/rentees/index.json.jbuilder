json.array!(@rentees) do |rentee|
  json.extract! rentee, :id, :name, :phone, :address, :tokens
  json.url rentee_url(rentee, format: :json)
end
