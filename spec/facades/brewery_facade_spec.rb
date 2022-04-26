require 'rails_helper'

RSpec.describe 'brewery facade' do
  describe 'find brewery' do 
    it 'can find brewery and forecast data' do
      location = 'denver,co'
      quantity = 5
      response = BreweryFacade.find_brewery(location, quantity)
      limit = response.take(quantity)

      expect(response).to be_an Array
    end
  end
end