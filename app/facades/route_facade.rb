class RouteFacade
  def self.travel_time(start, destination)
    MapqService.directions(start, destination)
  end

  def self.get_food(food, location)
    response = YelpService.find_food(food, location)
    response[:businesses][0] = Restaurant.new(response)
  end
end