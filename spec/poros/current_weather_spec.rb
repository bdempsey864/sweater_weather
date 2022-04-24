require 'rails_helper'

RSpec.describe CurrentWeather, :vcr do
  before :each do
    lat = 34.850746
    lon = -82.398964
    data = WeatherService.city_weather(lat, lon)
    @current_weather = CurrentWeather.new(data)
  end

  it 'can make a current weather object' do
    expect(@current_weather).to be_a(CurrentWeather)
    expect(@current_weather.datetime).to be_a(Time)
    expect(@current_weather.sunrise).to be_a(Time)
    expect(@current_weather.sunset).to be_a(Time)
    expect(@current_weather.temperature).to be_a(Float)
    expect(@current_weather.feels_like).to be_a(Float)
    expect(@current_weather.humidity).to be_a(Integer)
    expect(@current_weather.visibility).to be_a(Integer)
    expect(@current_weather.conditions).to be_a(String)
    expect(@current_weather.icon).to be_a(String)
  end

  it 'can serialize' do
    serialized = @current_weather.serialize

    expect(serialized).to be_a(Hash)
    expect(serialized).to have_key(:datetime)
    expect(serialized).to have_key(:sunrise)
    expect(serialized).to have_key(:sunset)
    expect(serialized).to have_key(:temperature)
    expect(serialized).to have_key(:feels_like)
    expect(serialized).to have_key(:humidity)
    expect(serialized).to have_key(:uvi)
    expect(serialized).to have_key(:visibility)
    expect(serialized).to have_key(:conditions)
    expect(serialized).to have_key(:icon)
  end
end