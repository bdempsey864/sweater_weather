require 'rails_helper'

RSpec.describe 'Munchies' do
  describe 'API' do
    it 'endpoint exists' do
      location = 'greenville,sc'
      quantity = 5

      get "/api/v1/breweries?location=#{location}&quantity=#{quantity}"

      expect(response).to be_successful
    end
  end
end
