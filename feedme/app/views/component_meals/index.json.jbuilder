json.array!(@component_meals) do |component_meal|
  json.extract! component_meal, :id, :meal_id, :component_belongs_to
  json.url component_meal_url(component_meal, format: :json)
end
