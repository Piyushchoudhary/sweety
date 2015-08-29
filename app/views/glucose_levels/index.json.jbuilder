json.array!(@glucose_levels) do |glucose_level|
  json.extract! glucose_level, :id
  json.url glucose_level_url(glucose_level, format: :json)
end
