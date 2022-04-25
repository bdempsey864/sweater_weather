require 'rails_helper'

RSpec.describe YelpService do
  describe 'food_search' do
    it 'can find food by destination' do
      location = 'greenville,sc'
      food = 'belgian'
      response = YelpService.food_search(food, location)

      expect(response).to be_a(Hash)
      expect(response[:businesses]).to be_a(Array)
      expect(response[:businesses][0]).to be_a(Hash)
      expect(response[:businesses][0]).to have_key(:name)
      expect(response[:businesses][0]).to have_key(:coordinates)
      expect(response[:businesses][0][:coordinates]).to have_key(:latitude)
      expect(response[:businesses][0][:coordinates]).to have_key(:longitude)
      expect(response[:businesses][0]).to have_key(:distance)
      expect(response[:businesses][0][:distance]).to be_a(Float)
    end
  end
end