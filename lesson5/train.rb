class Train

  include CompanyTrain

  attr_accessor :id_train, :type, :number_carriage, :speed, :route, :current_station, :number_train

  @@trains_number = {}

  def initialize(number_train,id_train, type)
    @number_train = number_train
    @id_train = id_train
    @type = type
    @number_carriage = []
    @speed = 0
    @@trains_number[number_train] == self
  end

  def find(number_train)
    puts "The train is "
    @@trains_number[number_train]
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

  def increase_carriage(carriage)
    if self.speed != 0
      puts "We can't increase the carriage when the train is driving"
    elsif self.type == carriage.type
      self.number_carriage << carriage
      puts "After increasing the train #{self.id_train} has the following number of carriage #{self.number_carriage.size}"
    else
      puts "The type of train is not correct"    
    end  
  end  

  def reduce_carriage
    self.number_carriage.pop  if self.speed == 0 
    puts "After reduce the train #{self.id_train} has the following number of carriage #{self.number_carriage.size}"
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






