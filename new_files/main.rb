# main program
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
  attr_accessor :stations, :trains, :carriages

  def initialize
    @stations = {}
    @trains = {}
    @carriages = {}
  end

  def print_choice1
    puts 'What would you like to do?'
    puts "Type '1' to create station"
    puts "Type '2' to create train"
    puts "Type '3' to add carriages to the train"
    puts "Type '4' to delete carriages from the train"
    puts "Type '5' to drive train"
  end

  def print_choice2
    puts "Type '6' to list stations"
    puts "Type '7' to list trains on the station"
    puts "Type '8' to list trains on the all stations"
    puts "Type '9' to take a place or volume in carriage"
    puts "Type '10' to list carriages for trains"
    puts "Type '0' to exit"
  end

  def menu_choice
    loop do
      print_choice1
      print_choice2

      choice = gets.chomp

      case choice
      when '1'
        puts "your choice is  'create station' "
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
        puts "your choice is 'to list trains on the all stations' "
        block_train_station
      when '9'
        puts "your choice is 'take a place or volume in carriage' "
        take_place_volume
      when '10'
        puts "your choice is 'to list carriages for trains'"
        block_carriages_train
      when '0'
        break
      else
        puts 'your choise is not correct, please repeat your choice'
      end
    end
end

  def block_train_station
    stations.each do |key, station|
      puts "Station: #{key} takes the following trains"
      station.block_train do |train|
        puts train
      end
    end
  end

  def block_carriages_train
    trains.each do |key, train|
      puts "Train: #{key} takes the following carriages"
      train.block_carriagres do |carriage1|
        puts carriage1
      end
    end
  end

  def create_station
    check_create_station
  rescue RuntimeError => e
    puts "Exception: #{e.message}"
    retry
  end

  def check_create_station
    puts 'Enter a name of station'
    name_station = gets.chomp
    stations[name_station] = Station.new(name_station)
    puts stations
  end

  def create_train
    check_create_train
  rescue RuntimeError => e
    puts "Exception: #{e.message}"
    retry
  end

  def check_create_train
    puts 'Enter a name of train'
    id_train = gets.chomp
    puts 'Enter a type of train, please enter cargo/passenger'
    type = gets.chomp
    if type == 'cargo'
      trains[id_train] = CargoTrain.new(id_train)
    elsif type == 'passenger'
      trains[id_train] = PassengerTrain.new(id_train)
    end
  end

  def add_carriage
    puts 'Enter a name of train'
    id_train = gets.chomp
    puts 'Enter number of carriage'
    nubmer_carriage = gets.chomp
    def_type_carriage(id_train, nubmer_carriage)
  end

  def def_type_carriage(id_train, nubmer_carriage)
    if trains[id_train].instance_of?(CargoTrain)
      add_cargo(nubmer_carriage, id_train)
    else
      add_passenger(nubmer_carriage, id_train)
    end
  end

  def add_cargo(nubmer_carriage, id_train)
    puts 'Enter general_volume'
    general_volume = gets.chomp
    carriage = CargoCarriage.new(nubmer_carriage, general_volume)
    trains[id_train].add_carriage(carriage)
    carriages[nubmer_carriage] = carriage
  end

  def add_passenger(nubmer_carriage, id_train)
    puts 'Enter a nubmer place in carriage'
    count_place = gets.chomp
    carriage = PassengerCarriage.new(nubmer_carriage, count_place)
    trains[id_train].add_carriage(carriage)
    carriages[nubmer_carriage] = carriage
  end

  def delete_carriage
    puts 'Enter a name of train'
    id_train = gets.chomp
    trains[id_train].delete_carriage
  end

  def take_place_volume
    puts 'Enter a name of carriage'
    nubmer_carriage = gets.chomp
    if carriages[nubmer_carriage].instance_of?(CargoCarriage)
      take_volume(nubmer_carriage)
    else
      carriages[nubmer_carriage].take_place
    end
  end

  def take_volume(nubmer_carriage)
    puts 'Enter a volume for carriage'
    volume = gets.chomp
    carriages[nubmer_carriage].take_volume(volume)
  end

  def drive_train
    puts 'Enter a name of train'
    id_train = gets.chomp
    puts 'Enter a name of station'
    station = gets.chomp
    stations[station].arrive_train(trains[id_train])
  end

  def list_stations
    puts stations
  end

  def list_train
    puts 'Enter a name of station'
    name_station = gets.chomp
    stations[name_station].show_trains
  end
end

obj1 = Main.new
obj1.menu_choice
