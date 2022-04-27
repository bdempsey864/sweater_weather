require 'rails_helper'

RSpec.describe UnsplashService, :vcr do
  describe 'picture' do
    it 'can connect to unsplash service and return a data hash' do
      location = 'greenville,sc'
      response = UnsplashService.picture(location)

      expect(response).to be_a(Hash)
      expect(response).to have_key(:results)
      expect(response[:results]).to be_a(Array)
      expect(response[:results][0]).to have_key(:urls)
      expect(response[:results][0][:urls]).to be_a(Hash)
      expect(response[:results][0][:urls]).to have_key(:regular)
      expect(response[:results][0][:urls][:regular]).to be_a(String)

      expect(response[:results][0]).to have_key(:user)
      expect(response[:results][0][:user]).to be_a(Hash)
      expect(response[:results][0][:user]).to have_key(:username)
      expect(response[:results][0][:user][:username]).to be_a(String)

      expect(response[:results][0][:user]).to have_key(:links)
      expect(response[:results][0][:user][:links]).to be_a(Hash)
      expect(response[:results][0][:user][:links]).to have_key(:html)
      expect(response[:results][0][:user][:links][:html]).to be_a(String)
    end
  end 
end