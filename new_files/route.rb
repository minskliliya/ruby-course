class Route

  attr_accessor :stations_route

  def initialize(start_station,end_station)
    validate!
    @stations_route = [start_station, end_station]
  end 

  def valid?
    validate!
  rescue
    false
  end
  
  def add_station(station)
    if self.stations_route.include?(station) 
      puts "it has already on the route" 
    else
      self.stations_route.insert(-2,station)
    end  
  end  

  def delete_station(station)
    if self.stations_route.include?(station)
      self.stations_route.delete(station)
    else 
      puts "no #{station} on this route"
    end  
  end  

  def show_route
    puts self.stations_route
  end  

  def next_station(current_station)
    if current_station != self.stations_route.last
      self.stations_route[self.stations_route.index(current_station)+1]
    end    
  end  

  def previous_station(current_station)
    if current_station != self.stations_route.first
      self.stations_route[self.stations_route.index(current_station)-1]
    end    
  end

  def to_s
    "Route is #{self.stations_route.first} - #{self.stations_route.last}"      
  end  

  protected

  def validate!
    raise "Start station can't be nil" if start_station.nil?
    raise "End station can't be nil" if end_station.nil?
    raise "Start station is wrong" if !start_station.is_a?(Station)
    raise "End station is wrong " if !end_station.is_a?(Station)
    true
  end
end  