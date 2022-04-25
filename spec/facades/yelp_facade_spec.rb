require 'rails_helper'

RSpec.describe YelpFacade do
  before :each do
    location = 'greenville,sc'
    food = 'belgian'
    @response = YelpService.food_search(food, location)
  end

  it 'finds places to eat' do
    expect(@response).to be_a Hash
    expect(@response[:businesses][0]).to be_a Hash
    expect(@response[:businesses][0][:name]).to eq("The Trappe Door")
    expect(@response[:businesses][0][:coordinates]).to be_a Hash
    expect(@response[:businesses][0][:coordinates]).to have_key(:latitude)
    expect(@response[:businesses][0][:coordinates]).to have_key(:longitude)
  end
end

