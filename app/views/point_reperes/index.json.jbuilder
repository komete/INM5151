json.array!(@point_reperes) do |point_repere|
  json.extract! point_repere, :id, :latitude, :longitude, :projection
  json.url point_repere_url(point_repere, format: :json)
end
