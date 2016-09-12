class Station

  attr_accessor :name_station, :trains

  @@all_stations = []

  NAME_STATION = /^[a-z]+$/i

  def initialize(name_station)
    @name_station = name_station
    @trains = []
    @@all_stations << self
    validate!
  end

  def valid?
    validate!
  rescue
    false
  end

  def arrive_train(train)
    self.trains << train
  end  
  
  def show_trains
    puts self.trains
  end

  def show_train_type(type)
    train_type  = []
    @trains.each do |train| 
      train_type << train.id_train if train.type == type 
    end
  end

  def dispatch_train(train)
    if self.trains.include?(train)
      self.trains.delete(train)
    else
      puts "Train #{train} is not on the station"
    end    
  end

  def self.all
    @@stations_all  
  end  

  protected

  def validate!
    raise "Station can't be nil" if name_station.nil?
    raise "Station should not be more than 15 symbols" if name_station.length > 15
    raise "Station's name has invalid format, it should be letters" if name_station !~ NAME_STATION
    true
  end
end  

