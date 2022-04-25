require 'rails_helper'

RSpec.describe YelpService do
  describe 'food_search' do
    it 'can find food by destination' do
      location = 'greenville,sc'
      food = 'belgian'
      response = YelpService.food_search(food, location)

      expect(response).to be_a(Hash)
    end
  end
end