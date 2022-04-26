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
      expect(response.take(quantity).count).to eq(5)
    end
  end
end