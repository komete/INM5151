json.array!(@troncon_routes) do |troncon_route|
  json.extract! troncon_route, :id, :vocation, :nb_chausse, :nb_voies, :etat, :acces, :res_vert, :sens, :res_europe, :num_route, :class_adm, :longueur
  json.url troncon_route_url(troncon_route, format: :json)
end
