class WeatherFacade
  def self.all_weather(lat, lon)
    response = WeatherService.city_weather(lat, lon)
    return current(response), hourly(response), daily(response)
  end

  def self.current(response)
    CurrentWeather.new(response)
  end

  def self.hourly(response)
    response[:hourly].map do |hour|
      HourlyWeather.new(hour)
    end
  end

  def self.daily(response)
    response[:daily].map do |day| 
      DailyWeather.new(day)
    end
  end  

  def self.destination_weather(lat, lon, trip_time)
    response = WeatherService.destination_weather(lat, lon)
    data = response[:hourly][trip_time - 1]
    DestinationWeather.new(data)
  end
end