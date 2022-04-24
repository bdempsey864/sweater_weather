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
end