json.array!(@indications) do |indication|
  json.extract! indication, :id, :component_id, :attendance_id
  json.url indication_url(indication, format: :json)
end
