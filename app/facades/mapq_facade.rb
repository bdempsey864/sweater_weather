class MapqFacade
  def self.coordinates(location)
    response = MapqService.coordinates(location)
    coord = response[:results][0][:locations][0][:latLng]
    return coord[:lat], coord[:lng]
  end
end