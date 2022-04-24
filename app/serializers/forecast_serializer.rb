class ForecastSerializer
  def self.weather(current, hourly, daily)
  { 
    data:
    { 
      id: nil,
      type: 'forecast', 
      attributes: 
      {
        current_weather: current,
        hourly_weather:
          hourly.map do |hour|
            hour
          end,
        daily_weather:
          daily.map do |day|
            day
          end
      }
    }
  }
  end
end