json.array!(@meals) do |meal|
  json.extract! meal, :id, :date_and_time_of_meal, :still_active, :deadline
  json.url meal_url(meal, format: :json)
end
