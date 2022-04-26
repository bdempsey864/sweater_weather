class Api::V1::BreweriesController < ApplicationController
  def index
    render json: {id: 'id', type: 'type', attributes: 'attributes', breweries: 'breweries'}
  end
end