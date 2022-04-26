require 'rails_helper'

RSpec.describe HourlyWeather do
  before :each do
    lat = 34.850746
    lon = -82.398964
    data = WeatherService.city_weather(lat, lon)
    hourly_weather = data[:hourly][0]
    @hour_object = HourlyWeather.new(hourly_weather)
  end

  it 'make hourly weather objects' do
    expect(@hour_object).to be_a(HourlyWeather)
    expect(@hour_object.time).to be_a(Time)
    expect(@hour_object.conditions).to be_a(String)
    expect(@hour_object.icon).to be_a(String)
  end

  it 'can serialize' do
    serialized = @hour_object.serialize

    expect(serialized).to be_a(Hash)
    expect(serialized).to have_key(:time)
    expect(serialized).to have_key(:temperature)
    expect(serialized).to have_key(:conditions)
    expect(serialized).to have_key(:icon)
  end
end