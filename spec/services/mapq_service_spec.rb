require "rails_helper"

RSpec.describe MapqService, :vcr do
  describe 'coordinates' do
    it 'can find lat and lon' do
      location = 'greenville,sc'

      response = MapqService.coordinates(location)

      expect(response).to be_a Hash

      coord = response[:results][0][:locations][0][:latLng]

      expect(coord).to be_a Hash
      expect(coord).to have_key(:lat)
      expect(coord).to have_key(:lng)
    end

    describe 'route' do
      it 'finds route if it exists' do
        from = 'greenville,sc'
        to = 'asheville,nc'
  
        response = MapqService.route(from, to)

        expect(response).to be_a(Hash)
        expect(response).to have_key(:route)
        expect(response[:route]).to have_key(:formattedTime)
        expect(response[:route]).to have_key(:routeError)
        expect(response[:route][:routeError]).to have_key(:errorCode)
        expect(response[:route][:routeError][:errorCode]).to eq(-400)
      end

      it 'returns error if route does not exist' do
        from = 'greenville,sc'
        to = 'paris,fr'
  
        response = MapqService.route(from, to)

        expect(response).to be_a(Hash)
        expect(response).to have_key(:route)
        expect(response[:route]).to have_key(:routeError)
        expect(response[:route][:routeError]).to have_key(:errorCode)
        expect(response[:route][:routeError][:errorCode]).to eq(2)
      end
    end
  end
end