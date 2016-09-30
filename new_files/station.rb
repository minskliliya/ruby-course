class Station

  attr_accessor :station_name, :trains

  def initialize(station_name)
    @station_name = station_name
    @trains = []
  end  

  def arrive_train(train)
    self.trains << train
    puts "Train #{train} arrived to #{self.station_name}"
  end
  
  def show_trains
    puts self.trains
  end  

  def show_trains_type
    puts "Enter type cargo or pass"
    type = gets.chomp
    train_by_type = []
    self.trains.each do |train|
      puts "#{train.type}"
      train_by_type << train if train.type == type
    end
    puts "the number of #{type} trains is #{train_by_type.length} "  
  end  

  def depart_train(train)
    if self.trains.include?(train) 
      self.trains.delete(train) 
    else
      puts "no #{train} on the station"
    end  
  end  

  def to_s
    "This station's name is #{self.station_name}"
  end

end  

