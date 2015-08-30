json.array!(@events) do |event|
  json.extract! event, :id, :title, :start_at, :end_at, :category, :body, :user_id
  json.url event_url(event, format: :json)
end
