json.array!(@components_meals) do |components_meal|
  json.extract! components_meal, :id, :meal, :component
  json.url components_meal_url(components_meal, format: :json)
end
