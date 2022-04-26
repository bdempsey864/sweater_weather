class Brewery
  attr_reader :destination, :name, :brewery_type, :id
  def initialize(data)
    require "pry"; binding.pry
    @destination = data[:city]
    @name = data[:name]
    @brewery_type = data[:brewery_type]
    @id = data[:id]
  end

  def serialize
    {
      id: @id,
      name: @name,
      brewery_type: @brewery_type
    }
  end
end