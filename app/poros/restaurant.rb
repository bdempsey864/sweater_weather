class Restaurant
  attr_reader :restaurant, :name, :address
  def initialize(data)
    @restaurant = data[:businesses][0]
    @name = data[:businesses][0][:name]
    @address = street_address
  end

  def street_address
    address = ""
    @restaurant[:location][:display_address].each do |place|
      address << (place + " ")
    end
    address
  end
end