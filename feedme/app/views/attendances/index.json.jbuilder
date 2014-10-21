json.array!(@attendances) do |attendance|
  json.extract! attendance, :id, :meal_id, :person_id, :going
  json.url attendance_url(attendance, format: :json)
end
