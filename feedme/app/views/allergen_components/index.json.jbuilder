json.array!(@allergen_components) do |allergen_component|
  json.extract! allergen_component, :id, :allergen_warning_id, :component_id
  json.url allergen_component_url(allergen_component, format: :json)
end
