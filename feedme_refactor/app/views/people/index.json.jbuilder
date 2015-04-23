json.array!(@people) do |person|
  json.extract! person, :id, :name, :username, :password_digest, :still_active, :staff
  json.url person_url(person, format: :json)
end
