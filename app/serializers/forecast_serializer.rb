class ForecastSerializer
  def self.weather(current, hourly, daily)
  { 
    data:
    { 
      id: nil,
      type: 'forecast', 
      attributes: 
      {
        current_weather: current.serialize,
        hourly_weather:
          hourly.map do |hour|
            hour.serialize
          end,
        daily_weather:
          daily.map do |day|
            day.serialize
          end
      }
    }
  }
  end
end