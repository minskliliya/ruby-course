require_relative 'module.rb'
require_relative 'route'
require_relative 'station'
require_relative 'train'
require_relative 'carriage'
require_relative 'cargo_carriage'
require_relative 'cargo_train'
require_relative 'passenger_carriage'
require_relative 'passenger_train'

class Main

  attr_accessor :stations, :trains

  def initialize
    @stations = {}
    @trains = {}
  end 

  def menu_choice 
    loop do 
      puts "What would you like to do?"
      puts "Type '1' to create station" 
      puts "Type '2' to create train"
      puts "Type '3' to add carriages to the train"
      puts "Type '4' to delete carriages from the train" 
      puts "Type '5' to drive train"
      puts "Type '6' to list stations"
      puts "Type '7' to list trains on the station"
      #puts "Type '8' to list carriages for trains"
      #puts "Type '9' to take a place or volume in carriage"
      puts "Type '0' to exit"

      choice = gets.chomp
   
    case choice
    when '1'
      #puts "your choice is  'create station' "
      create_station
    when '2'
      puts "your choice is  'create train' "
      create_train        
    when '3'
      puts "your choice is 'add carriages to the train' "
      add_carriage
    when '4'
      puts "your choice is 'delete carriages from the train' "
      delete_carriage
    when '5'
      puts "your choice is 'drive train' "
      drive_train    
    when '6'
      puts "your choice is 'list stations' "
      list_stations       
    when '7'
      puts "your choice is 'list trains on the station' "
      list_train
    when '8'
      puts "your choice is 'list carriages for trains' "
      list_carriage  
    when '9'
      puts "your choice is 'take a place or volume in carriage' "
      take_carriage        
    when '0'  
      break
    else 
      puts "your choise is not correct, please repeat your choice"
    end
  end  
end  


  def create_station
    puts "Enter a name of station"
    name_station = gets.chomp
    self.stations[name_station] = Station.new(name_station)
    puts self.stations 
  end

  
  def create_train
      puts "Enter a name of train"
      id_train = gets.chomp
      puts "Enter a type of train, please enter cargo/passenger"
      type = gets.chomp
      if type == "cargo"
        self.trains[id_train] = CargoTrain.new(id_train)
      elsif type == "passenger"
        self.trains[id_train] = PassengerTrain.new(id_train)
      end
    puts self.trains
  end
  
  def add_carriage
    puts "Enter a name of train"
    id_train = gets.chomp
    if  self.trains[id_train].type == "cargo"
      carriage = CargoCarriage.new
    else   
      carriage = PassengerCarriage.new
    end
    self.trains[id_train].add_carriage(carriage)
    puts self.trains
  end

  def delete_carriage
    puts "Enter a name of train"
    id_train = gets.chomp
    self.trains[id_train].delete_carriage
  end


  def drive_train
    puts "Enter a name of train"
    id_train = gets.chomp
    puts "Enter a name of station"
    station = gets.chomp
    self.stations[station].arrive_train(self.trains[id_train])
  end 

  def list_stations
    puts self.stations
  end

  def list_train
    puts "Enter a name of station"
    name_station = gets.chomp
    self.stations[name_station].show_trains
  end  
  
end     

obj1 = Main.new
obj1.menu_choice