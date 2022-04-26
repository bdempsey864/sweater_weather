require 'rails_helper'

RSpec.describe 'Breweries' do
  describe 'API' do
    it 'endpoint exists' do
      location = 'denver,co'
      quantity = 5

      get "/api/v1/breweries?location=#{location}&quantity=#{quantity}"

      expect(response).to be_successful
    end

    it 'should return the correct keys in JSON format' do
      location = "denver,co"
      quantity = 5
      
      get "/api/v1/breweries?location=#{location}&quantity=#{quantity}"
      json = JSON.parse(response.body, symbolize_names: true)
      keys = [:id, :type, :attributes]

      json.each do |k,v|
        expect(keys.include?(k)).to be_truthy
      end
    end
  end
end
