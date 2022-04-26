class BreweryService
  def self.conn
    Faraday.new(url: 'https://api.openbrewerydb.org')
  end

  def self.find_brewery(location)
    response = conn.get("/breweries/search?query=#{location}")
    JSON.parse(response.body, symbolize_names: true)
  end
end