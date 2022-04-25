class YelpService 
  def self.conn
    Faraday.new(url: "https://api.yelp.com")
  end

  def self.food_search(food, location)
    response = conn.get("/v3/businesses/search?term=#{food}&location=#{location}")
    JSON.parse(response.body, symbolize_names: true)
    require "pry"; binding.pry
  end
end