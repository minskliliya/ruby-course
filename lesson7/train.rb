class Train

  include CompanyTrain

  attr_accessor :id_train, :type, :number_carriage, :speed, :route, :current_station

  TRAIN_TYPE = /^cargo$|^passenger$/i
  ID_TRAIN = /^((\d|[a-z]){3})-?((\d|[a-z]){2})$/i     
 
  @@trains_number = {}

  def initialize(id_train, type)
    @id_train = id_train
    @type = type
    @number_carriage = []
    validate!
    @speed = 0
    @@trains_number[id_train] = self
  end

  def block_carriages(&block)
    self.number_carriage.each do |number|
      yield(number)
    end  
  end

  def valid?
    validate!
  rescue
    false
  end

  def find(id_train)
    puts "The train is "
    @@trains_number[id_train]
  end  

  def increase_speed(speed)
    self.speed += speed
  end
  
  def show_speed
    puts "#{self.id_train} has #{self.speed} speed" 
  end   

  def stop_train
    self.speed = 0
  end  

  def show_number_carriage
    puts "#{self.id_train} has #{self.number_carriage} carriages"
  end

  def increase_carriage(carriage)
    if self.speed != 0
      puts "We can't increase the carriage when the train is driving"
    elsif self.type == carriage.type
      self.number_carriage << carriage
    else
      puts "The type of train is not correct"    
    end  
  end  

  def reduce_carriage
    self.number_carriage.pop  if self.speed == 0 
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

  protected

  def validate!
    raise "Name of train can't be nil" if id_train.nil?
    raise "Type of train can't be nil" if type.nil?
    raise "Name of train has invalid format" if id_train !~ ID_TRAIN
    #raise "Type of train has invalid format" if type !~ TRAIN_TYPE
    true
  end

end  






