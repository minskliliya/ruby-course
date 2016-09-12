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
    validate!
  end  

  def valid?
    validate!
  rescue
    false
  end

  def add_station(new_station)
    self.route_stations.insert(-2,new_station) 
  end 

  def delete_station(old_station)
    self.route_stations.delete(old_station) 
  end

  def print_all_station
    self.route_stations
  end  

  protected

  def validate!
    raise "Start station can't be nil" if start_station.nil?
    raise "Start station should not be more than 15 symbols" if start_station.length > 15
    raise "Start station's name has invalid format, it should be letters" if start_station !~ Station::NAME_STATION
    raise "End station can't be nil" if end_station.nil?
    raise "End station should not be more than 15 symbols" if end_station.length > 15
    raise "End station's name has invalid format, it should be letters" if end_station !~ Station::NAME_STATION
    true
  end
end  


