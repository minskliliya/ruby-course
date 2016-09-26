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
      puts "Type '8' to list carriages for trains"
      puts "Type '9' to take a place or volume in carriage"
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
    begin
      puts "Enter a name of station"
      name_station = gets.chomp
      @stations[name_station] = Station.new(name_station)
    rescue RuntimeError => e
      puts "Exception: #{e.message}"
      retry
    end
    @stations 
  end

  
  def create_train
    begin
      puts "Enter a name of train"
      id_train = gets.chomp
      puts "Enter a type of train, please enter cargo/passenger"
      type = gets.chomp
      if type == "cargo"
        @trains[id_train] = CargoTrain.new(id_train,type)
      elsif type == "passenger"
        @trains[id_train] = PassengerTrain.new(id_train,type)
      end
    rescue RuntimeError => e
      puts "Exception: #{e.message}"
      retry
    end  
    puts @trains
  end
  
  def add_carriage
    puts "Enter a name of train"
    id_train = gets.chomp
    if  @trains[id_train].type == "cargo"
      puts "Enter general_volume"
      general_volume = gets.chomp
      carriage = CargoCarriage.new(general_volume) 
    else   
      puts "Enter a nubmer place in carriage"
      count_place = gets.chomp
      carriage = PassengerCarriage.new(count_place)
    end
    @trains[id_train].increase_carriage(carriage)
    puts @trains
  end

  def delete_carriage
    puts "Enter a name of train"
    id_train = gets.chomp
    @trains[id_train].reduce_carriage
    puts @trains
  end


  def drive_train
    puts "Enter a name of train"
    id_train = gets.chomp
    puts "Enter a name of station"
    station = gets.chomp
    @stations[station].arrive_train(@trains[id_train])
    puts @stations
  end 

  def list_stations

    puts @stations
  end

  def list_train
    puts @trains
  end  

  def list_carriage
    puts "Enter type id_train"
    id_train = gets.



  end  
end     

obj1 = Main.new()
obj1.menu_choice