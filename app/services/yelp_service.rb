class YelpService
  def self.conn
    Faraday.new(url: "https://api.yelp.com") do |conn|
      conn.request :authorization, 'Bearer', ENV['yelp_key']
    end
  end

  def self.find_food(food, location)
    response = conn.get("/v3/businesses/search?term=#{food}&location=#{location}")
    JSON.parse(response.body, symbolize_names: true)
  end
end