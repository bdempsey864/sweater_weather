class WeatherService
  def self.conn
    Faraday.new(url: 'https://api.openweathermap.org') do |request|
      request.headers['Content-Type'] = 'application/json'
      request.params['appid'] = ENV['weather_key']
    end
  end

  def self.city_weather(lat, lon)
    response = conn.get("/data/2.5/onecall") do |request|
      request.params['lat'] = lat
      request.params['lon'] = lon
      request.params['units'] = 'imperial'
      request.params['exclude'] = 'minutely,alerts'
    end
    JSON.parse(response.body, symbolize_names: true)
  end
end