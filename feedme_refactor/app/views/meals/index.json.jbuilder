json.array!(@meals) do |meal|
  json.extract! meal, :id, :date_and_time, :deadline
  json.url meal_url(meal, format: :json)
end
