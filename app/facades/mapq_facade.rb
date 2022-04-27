class MapqFacade
  def self.coordinates(location)
    response = MapqService.coordinates(location)
    coord = response[:results][0][:locations][0][:latLng]
    return coord[:lat], coord[:lng]
  end

  def self.route(from, to)
    response = MapqService.route(from, to)

    if response[:route][:routeError][:errorCode] == -400
      response[:route][:formattedTime]
    else
      return 'impossible'
    end
  end
end