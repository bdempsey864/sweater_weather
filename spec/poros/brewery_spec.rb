require 'rails_helper'

RSpec.describe Brewery do
  it 'can make a Brewery' do
    location = 'denver,co'
    quantity = 5
    data, forecast, breweries= BreweryFacade.find_brewery(location, quantity)

    expect(breweries).to be_an Array 
    expect(breweries.first).to be_a Brewery
    expect(breweries.first.name).to be_a String 
    expect(breweries.first.destination).to be_a String 
    expect(breweries.count).to eq(5)
  end
end