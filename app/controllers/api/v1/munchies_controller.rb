class Api::V1::MunchiesController < ApplicationController
  def index
    rf = RouteFacade.travel_time(params["start"], params["destination"])[:route]
    travel_time = rf[:formattedTime]
    lat = rf[:boundingBox][:ul][:lat]
    lon = rf[:boundingBox][:ul][:lng]
    coord = WeatherFacade.all_weather(lat, lon)
    current_conditions = coord.first.conditions
    current_temp = coord.first.temperature
    pizza = RouteFacade.get_food(params["food"], params["destination"])
    
    render json: MunchiesSerializer.data(travel_time, current_conditions, current_temp, params["destination"], pizza)
  end
end