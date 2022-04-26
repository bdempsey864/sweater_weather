class BreweryFacade
  def self.find_brewery(location, quantity)
    data = BreweryService.find_brewery(location)
    return data, forecast(location), breweries(data, quantity)
  end

  def self.forecast(location)
    coord = MapqFacade.coordinates(location)
    weather = WeatherFacade.all_weather(coord[0], coord[1])
    Forecast.new(weather)
  end

  def self.breweries(data, quantity)
    data.take(quantity.to_i).map do |d|
      Brewery.new(d)
    end
  end
end