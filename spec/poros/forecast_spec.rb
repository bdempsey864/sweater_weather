require 'rails_helper'

RSpec.describe Forecast do
  it 'can make a Forecast' do
    data = WeatherService.city_weather(39.7, -105)
    forecast = Forecast.new(data)

    expect(forecast).to be_a Forecast
    expect(forecast.summary).to be_a String
    expect(forecast.temperature).to be_a Float
  end
end