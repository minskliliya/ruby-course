# class Route (route):
class Route
  attr_accessor :route

  def initialize(start_station, end_station)
    validate!
    @route = [start_station, end_station]
  end

  def valid?
    validate!
  rescue
    false
  end

  def add_station(station)
    if route.include?(station)
      puts 'it has already on the route'
    else
      route.insert(-2, station)
    end
  end

  def delete_station(station)
    if route.include?(station)
      route.delete(station)
    else
      puts "no #{station} on this route"
    end
  end

  def show_route
    puts route
  end

  def next_station(current)
    route[route.index(current) + 1] if current != route.last
  end

  def previous_station(current)
    route[route.index(current) - 1] if current != route.first
  end

  def to_s
    "Route is #{stations_route.first} - #{stations_route.last}"
  end

  protected

  def validate!
    raise "Start station can't be nil" if start_station.nil?
    raise "End station can't be nil" if end_station.nil?
    raise 'Start station is wrong' unless start_station.is_a?(Station)
    raise 'End station is wrong ' unless end_station.is_a?(Station)
    true
  end
end
