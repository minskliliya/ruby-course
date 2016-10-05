class Train

  include CompanyTrain

  attr_accessor :number, :type, :carriages, :speed, :route, :current_station, :next_station

  TRAIN_TYPE = /^cargo$|^passenger$/i
  NUMBER_TRAIN = /^((\d|[a-z]){3})-?((\d|[a-z]){2})$/i 

  @@instances = {}

  def self.find(number)
    @@instances[number] 
  end  

  def initialize(number, type)
    @number = number
    @type = type
    @carriages = []
  #  validate!
    @speed = 0
    @@instances[number] = self
  end  

  def valid?
    validate!
  rescue
    false
  end

  def block_carriagres
    if block_given?  
      self.carriages.each do |carriage|
        yield(carriage)
      end
    end   
  end  

  def increase_speed(speed)
    self.speed += speed
  end 

  def show_speed
    puts self.speed
  end
  
  def stop_train
    self.speed = 0
  end    

  def show_count_carriage
    puts self.carriage_number.size
  end  

  def add_carriage(carriage)
    if self.speed == 0
      self.carriages << carriage
    else
      puts "stop train before add carriage"
    end
  end  

  def delete_carriage
    if self.speed == 0
      self.carriages.pop
    else
      puts "stop train before delete carriage"
    end
  end  
        
  def take_route(route)
    self.route = route
    self.current_station = self.route.stations_route.first
    self.route.stations_route.first.arrive_train(self)
  end  

  def next_station
    self.route.next_station(self.current_station)
  end

  def previous_station
    self.route.previous_station(self.current_station)  
  end  

  def move_next_station
    move_station = self.next_station
    self.current_station.depart_train(self)
    move_station.arrive_train(self)
    self.current_station = move_station
  end  
  
  def to_s
    "train is #{self.number}, type = #{self.type} and carriages = #{self.carriages.size}"
  end  

  protected

  def validate!
    raise "Name of train can't be nil" if number.nil?
    raise "Type of train can't be nil" if type.nil?
    raise "Name of train has invalid format" if number !~ NUMBER_TRAIN
    true
  end

end

