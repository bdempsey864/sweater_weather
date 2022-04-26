class Forecast
  attr_reader :summary,
              :temperature

  def initialize(data)
    @summary = data[:current][:weather][0][:description]
    @temperature = @temperature = data[:current][:temp]
  end

  def serialize
    {
      summary: @summary,
      temperature: @temperature.to_s + ' F'
    }
  end
end