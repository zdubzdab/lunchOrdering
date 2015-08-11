json.array!(@days) do |day|
  json.extract! day, :id, :name, :starts_at
  json.url day_url(day, format: :json)
end
