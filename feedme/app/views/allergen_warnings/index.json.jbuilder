json.array!(@allergen_warnings) do |allergen_warning|
  json.extract! allergen_warning, :id, :warning_content, :warning_title
  json.url allergen_warning_url(allergen_warning, format: :json)
end
