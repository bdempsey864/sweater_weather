require "rails_helper"

RSpec.describe MapqService do
  describe 'coordinates' do
    it 'can find lat and lon' do
      location = 'greenville, sc'

      response = MapqService.coordinates(location)

      expect(response).to be_a Hash

      coord = response[:results][0][:locations][0][:latLng]

      expect(coord).to be_a Hash
      expect(coord).to have_key(:lat)
      expect(coord).to have_key(:lng)
    end
  end
end