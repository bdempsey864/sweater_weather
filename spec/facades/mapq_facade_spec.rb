require 'rails_helper'

RSpec.describe MapqFacade, :vcr do
  describe 'coordinates' do
    it 'can find lat and lon' do
      location = 'greenville, sc'

      response = MapqFacade.coordinates(location)

      expect(response).to be_an Array 
      expect(response.first).to be_a Float 
      expect(response.last).to be_a Float 
    end
  end
end