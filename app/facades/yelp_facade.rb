class YelpFacade
  def self.food_search(food, location)
    data = YelpServices.food_search(food, location)
    return data, forecast(location)
  end

  def self.forecast(location)
    coord = MapqFacade.coordinates(location)
    response = WeatherService.all_weather(coord[:lat], coord:[:lon])
    require "pry"; binding.pry
    return Forecast.new(response)

  end
end