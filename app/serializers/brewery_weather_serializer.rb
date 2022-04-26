class BreweryWeatherSerializer
  def self.info(data, forecast, breweries)
    {
      data: 
      {
        id: nil,
        type: breweries,
        attributes: {
          destination: data[0][:city],
          forecast: forecast.serialize,
          breweries: breweries.map do |brewery|
            brewery.serialize
          end
        }
      }
    }
  end
end