class MapqService
  def self.conn
    Faraday.new(url: 'http://www.mapquestapi.com') do |req|
      req.headers['Content-Type'] = 'application/json'
      req.params['key'] = ENV['mapq_key']
    end
  end

  def self.coordinates(location)
    response = conn.get("/geocoding/v1/address?location=#{location}")
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.directions(start, destination)
    response = conn.get("/directions/v2/route?key=#{ENV['mapq_key']}&from=#{start}&to=#{destination}")
    JSON.parse(response.body, symbolize_names: true)
  end
end