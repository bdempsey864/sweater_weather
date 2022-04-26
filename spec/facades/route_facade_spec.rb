require 'rails_helper'

RSpec.describe RouteFacade do
  it 'travel_time()' do
    params = {
      "start": "greenville,sc",
      "destination": "greer,sc",
      "food": "pizza"
    }

    expect(RouteFacade.travel_time(params["start"], params["destination"])).to be_a Hash 
  end

  it 'has a restaurant' do
    data = {
      start: "greenville,sc", 
      destination: "greer,sc", 
      food: "pizza"
    }

    response = RouteFacade.get_food(data[:food], data[:destination])

    expect(response).to be_a Restaurant

  end
end