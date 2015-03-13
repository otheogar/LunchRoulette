json.array!(@availablities) do |availablity|
  json.extract! availablity, :id
  json.url availablity_url(availablity, format: :json)
end
