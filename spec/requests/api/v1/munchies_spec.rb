require 'rails_helper'

RSpec.describe 'Munchies' do
  describe 'API' do
    it 'endpoint exists' do
      start = "greenville, sc"
      destination = "greer, sc"
      food = "pizza"
      
      get "/api/v1/munchies?start=#{start}&destination=#{destination}&food=#{food}"

      expect(response).to be_successful
    end

    it 'should return the correct keys in JSON format' do
      start = "greenville,sc"
      destination = "greer,sc"
      food = "pizza"
      
      get "/api/v1/munchies?start=#{start}&destination=#{destination}&food=#{food}"
      json = JSON.parse(response.body, symbolize_names: true)
      keys = [:id, :type, :attributes, :restaurant]

      json[:data].each do |k,v|
        expect(keys.include?(k)).to be_truthy
      end
    end

    it 'returns a successful response' do 
      start = "greenville,sc"
      destination = "greer,sc"
      food = "pizza"
      
      get "/api/v1/munchies?start=#{start}&destination=#{destination}&food=#{food}"


    end
  end
end