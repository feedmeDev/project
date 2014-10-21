json.array!(@feedback_for_meals) do |feedback_for_meal|
  json.extract! feedback_for_meal, :id, :meal_id, :person_belongs_to, :body, :date_of_meal
  json.url feedback_for_meal_url(feedback_for_meal, format: :json)
end
