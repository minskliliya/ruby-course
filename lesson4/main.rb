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
      delete_carriage    
    when '6'
      puts "your choice is 'list stations' "
      list_stations       
    when '7'
      puts "your choice is 'list trains on the station' "
      list_train
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
    @stations[name_station] = Station.new(name_station)
    puts @stations 
  end
  
  def create_train
    puts "Enter a name of train"
    id_train = gets.chomp
    puts "Enter a type of train"
    type = gets.chomp
    
    if type == "cargo"
      @trains[id_train] = CargoTrain.new(id_train)
    elsif type == "passenger"
      @trains[id_train] = PassaengerTrain.new(id_train)
    else             
      puts "The type is incorrect"
    end
  end
  
  def add_carriage
    

  end

  def delete_carriage

  end

  def list_stations

  end

  def list_train

  end  
end     