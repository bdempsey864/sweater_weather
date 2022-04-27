require 'rails_helper'

RSpec.describe MapqFacade, :vcr do
  describe 'coordinates' do
    it 'find lat and lon' do
      location = 'greenville,sc'

      response = MapqFacade.coordinates(location)

      expect(response).to be_an Array 
      expect(response.first).to be_a Float 
      expect(response.last).to be_a Float 
    end
  end

  describe 'route' do
    it 'finds travel time for route' do
      from = 'greenville,sc'
      to = 'asheville,nc'

      response = MapqFacade.route(from, to)

      expect(response).to be_a(String)
      expect(response).to_not eq('impossible')
    end

    it 'returns error if route is not possible' do
      from = 'greenville,sc'
      to = 'paris,fr'

      response = MapqFacade.route(from, to)

      expect(response).to be_a(String)
      expect(response).to eq('impossible')
    end
  end
end