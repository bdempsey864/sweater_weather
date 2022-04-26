class BreweryFacade
  def self.find_brewery(location)
    data = BreweryService.find_brewery(location)
    return data, forecast(location), breweries(data)
  end

  def self.forecast(location)
    coord = MapqFacade.coordinates(location)
    weather = WeatherFacade.all_weather(coord[0], coord[1])
    Forecast.new(weather)
  end

  def self.breweries(data)
    data.each do |d|
      Brewery.new(d)
    end
  end
end