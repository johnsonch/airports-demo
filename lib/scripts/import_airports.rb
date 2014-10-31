class ImportAirports
  require 'csv'
  def self.execute(csv_path)
    CSV.foreach(csv_path) do |row|
      airport = Airport.new
      airport.ident = row[1]
      airport.airport_type = row[2]
      airport.name = row[3]
      airport.latitude_deg = row[4]
      airport.longitude_deg = row[5]
      airport.elevation_ft = row[6]
      airport.continent = row[7]
      airport.iso_country = row[8]
      airport.iso_region = row[9]
      airport.municipality = row[10]
      airport.scheduled_service = row[11]
      airport.gps_code = row[12]
      airport.iata_code = row[13]
      airport.local_code = row[14]
      airport.home_link = row[15]
      airport.wikipedia_link = row[16]
      airport.keywords = row[17]
      airport.save
    end
  end
end

unless Rails.env == 'test'
  ImportAirports.execute(ARGV[0])
end
