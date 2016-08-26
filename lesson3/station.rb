#Класс Station (Станция):
#Имеет название, которое указывается при ее создании
#Может принимать поезда (по одному за раз)
#Может показывать список всех поездов на станции, находящиеся в текущий момент
#Может показывать список поездов на станции по типу (см. ниже): кол-во грузовых, пассажирских
#Может отправлять поезда (по одному за раз, при этом, поезд удаляется из списка поездов, находящихся на станции).

class Station

  attr_accessor :name_station, :trains

  def initialize(name_station)
    @name_station = name_station
    @trains = []
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

end  

