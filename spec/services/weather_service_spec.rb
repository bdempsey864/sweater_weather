require 'rails_helper'

RSpec.describe WeatherService do
  describe 'weather data' do
    it 'has weather data; current, hourly, daily' do
      lat = 34.850746
      lon = -82.398964

      response = WeatherService.city_weather(lat, lon)

      expect(response).to be_a Hash

      expect(response).to have_key(:lat)
      expect(response[:lat]).to eq(34.8507)

      expect(response).to have_key(:lon)
      expect(response[:lon]).to eq(-82.399)

      expect(response).to have_key(:current)
      expect(response[:current]).to be_a Hash

      expect(response).to have_key(:hourly)
      expect(response[:hourly]).to be_an Array
      expect(response[:hourly][0]).to be_a Hash

      expect(response).to have_key(:daily)
      expect(response[:daily]).to be_an Array
      expect(response[:daily][0]).to be_a Hash

      expect(response.has_key?(:minutely)).to eq(false)
      expect(response.has_key?(:alerts)).to eq(false)
    end
  end
end