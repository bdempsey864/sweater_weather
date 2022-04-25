class YelpService 
  def self.conn
    Faraday.new(url: "https://api.yelp.com") do |conn|
      conn.request :authorization, 'Bearer', 'bduUfztld9gmSGgxxtaZYcuSInci9_GM9ChJya5dFIY2C33sTE1yUtsyhGUgbxKxugicam7-0DCkhwZ0VJv9lo3jocIAM9ccVxG_B_YASVY-pPJE0GlqNd1JfI9lYnYx '
    end
  end

  def self.food_search(food, location)
    response = conn.get("/v3/businesses/search?term=#{food}&location=#{location}")
    JSON.parse(response.body, symbolize_names: true)
  end
end