#Класс Route (Маршрут):
#Имеет начальную и конечную станцию, а также список промежуточных станций. Начальная и конечная станции
#указываютсся при создании маршрута, а промежуточные могут добавляться между ними.
#Может добавлять промежуточную станцию в список
#Может удалять промежуточную станцию из списка
#Может выводить список всех станций по-порядку от начальной до конечной

class Route

  attr_accessor :route_stations

  def initialize(start_station, end_station)
    @route_stations = [start_station, end_station]
  end

  def add_station(new_station)
    self.route_stations.insert(-2,new_station) 
    puts "A new station was added to the route. It is a #{new_station}"
  end 

  def delete_station(old_station)
    self.route_stations.delete(old_station) 
  end

  def print_all_station
    puts "All station on the route #{self.route_stations}" 
  end  
end  


