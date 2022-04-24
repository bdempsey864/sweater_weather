class Image
  attr_reader :location,
              :image_url,
              :source,
              :author,
              :profile

  def initialize(data, location)
    @location = location
    @image_url = data[:results][0][:urls][:regular]
    @source = 'unsplash.com'
    @author = data[:results][0][:user][:username]
    @profile = data[:results][0][:user][:links][:html]
  end
  
  def serialize
    {
      image: {
        location: @location,
        image_url: @image_url,
        credit: {
          source: @source,
          author: @author,
          profile: @profile
        }
      }
    }
  end
end