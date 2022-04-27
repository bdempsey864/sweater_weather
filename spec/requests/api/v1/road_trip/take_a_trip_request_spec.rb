require 'rails_helper'

RSpec.describe 'user can plan a road trip', :vcr do
  before :each do
    @user_1 = User.create!(email: Faker::Internet.email,
                          password: 'password',
                          password_confirmation: 'password')

    @api_key_1 = @user_1.api_keys.first.token

    @headers = {
      'CONTENT_TYPE' => 'application/json',
      'ACCEPT' => 'application/json'
    }

    # corrent input
    @body_1 = {
      'origin': 'greenville,sc',
      'destination': 'asheville,nc',
      'api_key': @api_key_1
    }.to_json

    # impossible route
    @body_2 = {
      'origin': 'greenville,sc',
      'destination': 'paris,fr',
      'api_key': @api_key_1
    }.to_json

    # bad api key
    @body_3 = {
      'origin': 'greenville,sc',
      'destination': 'asheville,nc',
      'api_key': 'bananas'
    }.to_json

    # no api api key 
    @body_4 = {
      'origin': 'greenville,sc',
      'destination': 'asheville,nc',
    }.to_json
  end

  describe 'happy paths' do
    it 'returns road trip data if route is possible' do
      post '/api/v1/road_trip', headers: @headers, params: @body_1

      result = JSON.parse(response.body, symbolize_names: true)

      expect(result).to be_a(Hash)
      expect(result).to have_key(:data)
      expect(result[:data]).to have_key(:id)
      expect(result[:data][:id]).to eq(nil)
      expect(result[:data]).to have_key(:type)
      expect(result[:data][:type]).to eq('roadtrip')
      expect(result[:data]).to have_key(:attributes)
      expect(result[:data][:attributes]).to have_key(:start_city)
      expect(result[:data][:attributes]).to have_key(:end_city)
      expect(result[:data][:attributes]).to have_key(:travel_time)
      expect(result[:data][:attributes][:travel_time]).to be_a(String)
      expect(result[:data][:attributes][:travel_time]).to_not eq('impossible')
      expect(result[:data][:attributes]).to have_key(:weather_at_eta)
      expect(result[:data][:attributes][:weather_at_eta].empty?).to eq(false)
      expect(result[:data][:attributes][:weather_at_eta]).to have_key(:temperature)
      expect(result[:data][:attributes][:weather_at_eta]).to have_key(:conditions)
    end

    it 'returns impossible road trip json if route is not possible' do
      post '/api/v1/road_trip', headers: @headers, params: @body_2

      result = JSON.parse(response.body, symbolize_names: true)

      expect(result).to be_a(Hash)
      expect(result).to have_key(:data)
      expect(result[:data]).to have_key(:id)
      expect(result[:data][:id]).to eq(nil)
      expect(result[:data]).to have_key(:type)
      expect(result[:data][:type]).to eq('roadtrip')
      expect(result[:data]).to have_key(:attributes)
      expect(result[:data][:attributes]).to have_key(:start_city)
      expect(result[:data][:attributes]).to have_key(:end_city)
      expect(result[:data][:attributes]).to have_key(:travel_time)
      expect(result[:data][:attributes][:travel_time]).to eq('impossible')
      expect(result[:data][:attributes]).to have_key(:weather_at_eta)
      expect(result[:data][:attributes][:weather_at_eta]).to be_a(Hash)
      expect(result[:data][:attributes][:weather_at_eta].empty?).to eq(true)
    end
  end

  describe 'sad paths' do
    it 'returns error if sends bad api_key' do
      post '/api/v1/road_trip', headers: @headers, params: @body_3

      expect(response.status).to eq(401)

      result = JSON.parse(response.body, symbolize_names: true)

      expect(result[:error]).to eq('Bad credentials')
    end

    it 'returns error if api_key is not sent' do
      post '/api/v1/road_trip', headers: @headers, params: @body_4

      expect(response.status).to eq(401)

      result = JSON.parse(response.body, symbolize_names: true)

      expect(result[:error]).to eq('Bad credentials')
    end

    it 'returns error with incorrect content type' do
      post '/api/v1/road_trip', params: @body_1

      expect(response.status).to eq(400)

      result = JSON.parse(response.body, symbolize_names: true)

      expect(result[:errors]).to eq('Json content type required')
    end
  end
end