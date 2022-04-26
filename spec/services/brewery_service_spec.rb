require 'rails_helper'

RSpec.describe BreweryService do
  describe 'find_brewery' do
    it 'can find find a brewery' do
      location = 'denver,co'
      quantity = 5
      response = BreweryService.find_brewery(location)

      expect(response).to be_an Array
      expect(response[0]).to have_key(:name)
      expect(response[0]).to have_key(:city)

      limit = response.take(quantity)
      
      expect(response.count).to eq(limit.count)

    end
  end
end