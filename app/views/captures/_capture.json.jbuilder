json.extract! capture, :id, :imgurl, :url_id, :star, :w, :h, :zoom, :created_at, :updated_at
json.url capture_url(capture, format: :json)
