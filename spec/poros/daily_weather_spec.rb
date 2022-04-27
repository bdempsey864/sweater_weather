require 'rails_helper'

RSpec.describe DailyWeather, :vcr do
  before :each do
    lat = 34.850746
    lon = -82.398964
    data = WeatherService.city_weather(lat, lon)
    daily_weather = data[:daily][0]
    @object = DailyWeather.new(daily_weather)
  end

  it 'can make daily weather objects' do
    expect(@object).to be_a(DailyWeather)
    expect(@object.conditions).to be_a(String)
    expect(@object.date).to be_a(Time)
    expect(@object.icon).to be_a(String)
    expect(@object.max_temp).to be_a(Float)
    expect(@object.min_temp).to be_a(Float)
    expect(@object.sunrise).to be_a(Time)
    expect(@object.sunset).to be_a(Time)
  end

  it 'can serialize' do
    serialized = @object.serialize
    expect(serialized).to be_a(Hash)
    expect(serialized).to have_key(:date)
    expect(serialized).to have_key(:sunrise)
    expect(serialized).to have_key(:sunset)
    expect(serialized).to have_key(:max_temp)
    expect(serialized).to have_key(:min_temp)
    expect(serialized).to have_key(:conditions)
    expect(serialized).to have_key(:icon)
  end
end