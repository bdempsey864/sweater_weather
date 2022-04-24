class Api::V1::ForecastController < ApplicationController
  def index
    if params[:location].present?
      lat, lon = MapqFacade.coordinates(params[:location])
      current, hourly, daily = WeatherFacade.all_weather(lat, lon)
      
      render json: ForecastSerializer.weather(current, hourly[0..7], daily[0..4])

    else
      bad_request('City and state is required')
    end
  end
end