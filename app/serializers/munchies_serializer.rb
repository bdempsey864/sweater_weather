class MunchiesSerializer
  def self.data(travel_time, current_conditions, current_temp, destination, pizza)
    {
      "data": {
        "id": "null",
        "type": "munchie",
        "attributes": {
          "destination_city": destination,
          "travel_time": travel_time,
          "forecast": {
            "summary": current_conditions,
            "temp": current_temp,
          },
          "restaurant": {
            "name": pizza.name,
            "address": pizza.address
          }
        }
      }
    }
  end
end