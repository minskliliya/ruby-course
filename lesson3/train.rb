#Класс Train (Поезд):
# Имеет номер (произвольная строка) и тип (грузовой, пассажирский) и количество вагонов, эти данные указываются при создании экземпляра класса
# Может набирать скорость
# Может показывать текущую скорость
# Может тормозить (сбрасывать скорость до нуля)
# Может показывать количество вагонов
# Может прицеплять/отцеплять вагоны (по одному вагону за операцию, метод просто увеличивает или уменьшает количество вагонов). 
#Прицепка/отцепка вагонов может осуществляться только если поезд не движется.
# Может принимать маршрут следования (объект класса Route)
# Может перемещаться между станциями, указанными в маршруте.
# Показывать предыдущую станцию, текущую, следующую, на основе маршрута

class Train

  attr_accessor :id_train, :type, :number_carriage, :speed, :route, :current_station

  def initialize(id_train, type, number_carriage)
    @id_train = id_train
    @type = type
    @number_carriage = number_carriage
    @speed = 0
  end

  def increase_speed(speed)
    self.speed += speed
  end
  
  def show_speed
    puts "#{self.id_train} has #{self.speed} speed" 
  end   

  def stop_train
    self.speed = 0
    puts "#{self.id_train} train has been stopped"
  end  

  def show_number_carriage
    puts "#{self.id_train} has #{self.number_carriage} carriages"
  end

  def increase_carriage
    self.number_carriage +=1 if self.speed == 0
    puts "After increasing the train #{self.id_train} has the following number of carriage #{self.number_carriage}"
  end  

  def reduce_carriage
    self.number_carriage -=1 if self.speed == 0
    puts "After reduce the train #{self.id_train} has the following number of carriage #{self.number_carriage}"
  end  

  def take_route(route)
    @route = route
    self.current_station = @route.route_stations[0]
    self.current_station.arrive_train(self)
  end

  def go_other_station(station)
    if self.route.route_stations.find_index(station)
      self.current_station.dispatch_train(self)
      self.current_station = station
      self.current_station.arrive_train(self)
    else puts "No route to #{station.name_station}!"
    end
  end

  def next_station
    self.route.route_stations[location+1].name_station
  end


  def location
    self.route.route_stations.find_index(current_station)
  end  
    
end  






