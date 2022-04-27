require 'rails_helper'

RSpec.describe 'user login' do
  before :each do
    user_1 = User.create!(email: Faker::Internet.email, 
                          password: 'password', 
                          password_confirmation: 'password')
    @headers = { 
      'CONTENT_TYPE' => 'application/json',
      'ACCEPT' => 'application/json'
     }

    #correct input
    @user_params_1 = { 
      email: User.last.email,
      password: 'password'
    }.to_json

    #bad password
    @user_params_2 = {
      email: User.last.email,
      password: 'pickles'
    }.to_json

    #bad email
    @user_params_3 = { 
      email: 'pitterp@ter.com',
      password: 'password'
    }.to_json
  end

  describe 'happy paths' do
    it 'can login a user' do
      post '/api/v1/sessions', headers: @headers, params: @user_params_1

      expect(response.status).to eq(200)

      result = JSON.parse(response.body, symbolize_names: true)

      expect(result).to be_a(Hash)
      expect(result).to have_key(:data)
      expect(result[:data]).to have_key(:type)
      expect(result[:data]).to have_key(:id)
      expect(result[:data]).to have_key(:attributes)
      expect(result[:data][:attributes]).to have_key(:email)
      expect(result[:data][:attributes]).to have_key(:api_key)
      expect(result[:data][:attributes][:api_key]).to be_a(String)
    end
  end

  describe 'sad paths' do
    it 'returns error with bad password' do
      post '/api/v1/sessions', headers: @headers, params: @user_params_2

      expect(response.status).to eq(400)

      result = JSON.parse(response.body, symbolize_names: true)

      expect(result[:errors]).to eq("Sorry, your credentials are invalid. Try Again.")
    end

    it 'returns error with bad email' do
      post '/api/v1/sessions', headers: @headers, params: @user_params_3

      expect(response.status).to eq(400)

      result = JSON.parse(response.body, symbolize_names: true)

      expect(result[:errors]).to eq("Sorry, your credentials are invalid. Try Again.")
    end

    it 'returns error with bad content type' do
      post '/api/v1/sessions', params: @user_params_1

      expect(response.status).to eq(400)

      result = JSON.parse(response.body, symbolize_names: true)

      expect(result[:errors]).to eq('Json content type required')
    end
  end
end