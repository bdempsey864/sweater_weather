class CurrentWeather
  attr_reader :datetime,
              :sunrise,
              :sunset,
              :temperature,
              :feels_like,
              :humidity,
              :uvi,
              :visibility,
              :conditions,
              :icon
  def initialize(data)
    @datetime = Time.at(data[:current][:dt])
    @sunrise = Time.at(data[:current][:sunrise])
    @sunset = Time.at(data[:current][:sunset])
    @temperature = data[:current][:temp]
    @feels_like = data[:current][:feels_like]
    @humidity = data[:current][:humidity]
    @uvi = data[:current][:uvi]
    @visibility = data[:current][:visibility]
    @conditions = data[:current][:weather][0][:description]
    @icon = data[:current][:weather][0][:icon]
  end

  def serialize
    {
      datetime: @datetime.to_s,
      sunrise: @sunrise.to_s,
      sunset: @sunset.to_s,
      temperature: @temperature,
      feels_like: @feels_like,
      humidity: @humidity,
      uvi: @uvi,
      visibility: @visibility,
      conditions: @conditions,
      icon: @icon
    }
  end
end