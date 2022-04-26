class Api::V1::BreweriesController < ApplicationController
  def index
    if num = params[:quantity].to_i > 0
      data, forecast, breweries = BreweryFacade.find_brewery(params[:location], params[:quantity])
      render json: BreweryWeatherSerializer.info(data, forecast, breweries)
    else
      render json: {error: 'quantity must be greater than zero'}
    end
  end
end