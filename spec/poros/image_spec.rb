require 'rails_helper'

RSpec.describe Image, :vcr do
  before :each do
    @location = 'greenville,sc'
    @data = UnsplashService.picture(@location)
    @image = Image.new(@data, @location)
  end

  it 'can make an image object' do

    expect(@image).to be_an(Image)
    expect(@image.location).to eq(@location)
    expect(@image.image_url).to be_a(String)
    expect(@image.source).to eq('unsplash.com')
    expect(@image.author).to be_a(String)
    expect(@image.profile).to be_a(String)
  end

  it 'can serialize' do 
    serialized = @image.serialize

    expect(serialized).to be_a(Hash)
    expect(serialized).to have_key(:image)
    expect(serialized[:image]).to be_a(Hash)
    expect(serialized[:image]).to have_key(:location)
    expect(serialized[:image][:location]).to be_a(String)
    expect(serialized[:image]).to have_key(:image_url)
    expect(serialized[:image][:image_url]).to be_a(String)
    expect(serialized[:image]).to have_key(:credit)
    expect(serialized[:image][:credit]).to be_a(Hash)
    expect(serialized[:image][:credit]).to have_key(:source)
    expect(serialized[:image][:credit][:source]).to be_a(String)
    expect(serialized[:image][:credit]).to have_key(:author)
    expect(serialized[:image][:credit][:author]).to be_a(String)
    expect(serialized[:image][:credit]).to have_key(:profile)
    expect(serialized[:image][:credit][:profile]).to be_a(String)
  end
end