require 'rails_helper'

RSpec.describe YelpService do
  it 'API' do 
    data = {
      start: "greenville,sc", 
      destination: "greer,sc", 
      food: "pizza"
    }
  
    response = MapqService.directions(data[:start], data[:destination])
    expect(response).to be_a Hash
  end

  it 'finds food' do
    data = {
      start: "greenville,sc", 
      destination: "greer,sc", 
      food: "pizza"
    }
  
    response = YelpService.find_food(data[:food], data[:destination])

    expect(response).to be_a Hash
  end
end