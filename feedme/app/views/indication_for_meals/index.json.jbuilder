json.array!(@indication_for_meals) do |indication_for_meal|
  json.extract! indication_for_meal, :id, :component_id, :attendance_id
  json.url indication_for_meal_url(indication_for_meal, format: :json)
end
