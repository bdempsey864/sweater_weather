class UnsplashService
  def self.conn 
    Faraday.new(url: "https://api.unsplash.com") do |request|
      request.headers['Content-Type'] = 'application/json'
      request.params['client_id'] = ENV['unsplash_access_key']
    end
  end

  def self.picture(location)
    response = conn.get("/search/photos?query=#{location}")
    JSON.parse(response.body, symbolize_names: true)
  end
end