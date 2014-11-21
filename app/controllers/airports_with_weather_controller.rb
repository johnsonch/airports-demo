class AirportsWithWeatherController < ApplicationController
  def index
    @airports = Airport.all(:limit => 25)
    @airports_with_weather = []
    @airports.each do |airport|
      @airports_with_weather << { name: airport.name,
                                  current_weather: get_current_weather(airport.latitude_deg, airport.longitude_deg)}
    end
    @airports_with_weather
  end

  private
  def get_current_weather(lat, long)
    response = RestClient.get "http://api.openweathermap.org/data/2.5/weather", :params => {:lat => lat, :lon => long}
    return ((JSON.parse(response.body)["main"]["temp"] - 273.15)* 1.8000 + 32.00).round(0)
  end
end
