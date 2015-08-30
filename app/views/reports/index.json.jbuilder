json.array!(@reports) do |report|
  json.extract! report, :id, :daily_date, :body, :public, :confidentiality, :rank, :user_id
  json.url report_url(report, format: :json)
end
