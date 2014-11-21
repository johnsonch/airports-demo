json.array!(@airports) do |airport|
  json.extract! airport, :ident, :airport_type, :name, :latitude_deg, :longitude_deg, :elevation_ft, :continent, :iso_country, :iso_region, :municipality, :scheduled_service, :gps_code, :iata_code, :local_code, :home_link, :wikipedia_link, :keywords
  json.url airport_url(airport, format: :json)
end
