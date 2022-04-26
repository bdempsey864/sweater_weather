require 'rails_helper'

RSpec.describe Brewery do
  it 'can make a Brewery' do
    location = 'denver,co'
    quantity = 5
    response = BreweryFacade.find_brewery(location).first

    expect(response.first).to be_a Brewery 
    expect(response.first[:name]).to be_a String 
    expect(response.first[:city]).to be_a String 
  end
end