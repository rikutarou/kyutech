json.array!(@captures) do |capture|
  json.extract! capture, :id, :title, :url
  json.url capture_url(capture, format: :json)
end
