require 'rails_helper'

RSpec.describe WeatherFacade do
  describe 'weather data' do
    it 'has weather data' do
      lat = 34.850746
      lon = -82.398964

      response = WeatherFacade.all_weather(lat, lon)

      expect(response).to be_an Array
      expect(response[0]).to be_a CurrentWeather
      expect(response[1]).to be_an Array
      expect(response[1]).to include(an_instance_of(HourlyWeather))
      expect(response[2]).to be_an Array
      expect(response[2]).to include(an_instance_of(DailyWeather))
    end
  end
end