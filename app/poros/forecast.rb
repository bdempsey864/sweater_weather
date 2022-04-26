class Forecast
  attr_reader :summary,
              :temperature

  def initialize(data)
    @summary = data[0].conditions
    @temperature = data[0].temperature
  end

  def serialize
    {
      summary: @summary,
      temperature: @temperature.to_s + ' F'
    }
  end
end