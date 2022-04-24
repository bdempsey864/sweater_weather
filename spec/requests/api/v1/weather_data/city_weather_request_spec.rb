require 'rails_helper'

RSpec.describe "weather data for a city" do
  describe "happy paths" do
    it 'returns weather data for a city' do
      location = 'greenville, sc'
      get "/api/v1/forecast?location=#{location}"
      result = JSON.parse(response.body, symbolize_names: true)

      expect(result).to be_a Hash
      expect(result).to have_key(:data)
      expect(result[:data]).to be_a(Hash)
      expect(result[:data]).to have_key(:id)
      expect(result[:data][:id]).to eq(nil)
      expect(result[:data][:type]).to eq('forecast')
      expect(result[:data][:attributes]).to be_a(Hash)

      expect(result[:data][:attributes]).to have_key(:current_weather)
      expect(result[:data][:attributes][:current_weather]).to be_a(Hash)

      expect(result[:data][:attributes]).to have_key(:hourly_weather)
      expect(result[:data][:attributes][:hourly_weather]).to be_an(Array)
      expect(result[:data][:attributes][:hourly_weather].first).to be_a(Hash)
      expect(result[:data][:attributes][:hourly_weather].count).to eq(8)

      expect(result[:data][:attributes]).to have_key(:daily_weather)
      expect(result[:data][:attributes][:daily_weather]).to be_an(Array)
      expect(result[:data][:attributes][:daily_weather].first).to be_a(Hash)
      expect(result[:data][:attributes][:daily_weather].count).to eq(5)
    end
  end
end