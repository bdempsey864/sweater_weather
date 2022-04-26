class Api::V1::BreweriesController < ApplicationController
  def index
    render json: JSON.parse(response.body, symbolize_names: true)
  end
end