class Station

  attr_accessor :name_station, :trains

  @@all_stations = []

  def initialize(name_station)
    @name_station = name_station
    @trains = []
    @@all_stations << self
  end

  def arrive_train(train)
    self.trains << train
    puts "Train #{train} arrived to #{self.name_station}"
  end  
  
  def show_trains
    puts "All trains:"
    puts self.trains
  end

  def show_train_type(type)
    train_type  = []
    @trains.each do |train| 
      train_type << train.id_train if train.type == type 
    end
    puts "The nubmer of #{type} trains is #{train_type.size}"  
  end

  def dispatch_train(train)
    if self.trains.include?(train)
      puts "Train #{train} dispathes"
      self.trains.delete(train)
    else
      puts "Train #{train} is not on the station"
    end    
  end

  def self.all
    puts "All stations: " 
    @@stations_all  
  end  

end  

