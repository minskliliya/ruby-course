# class Station
class Station
  NAME_STATION = /^[a-z]+$/i

  attr_accessor :station_name, :trains

  @@instances = []

  def self.all
    puts @@instances
  end

  def initialize(station_name)
    @station_name = station_name
    @trains = []
    validate!
    @@instances << self
  end

  def valid?
    validate!
  rescue
    false
  end

  def block_train
    if block_given?
      trains.each do |train|
        yield(train)
      end
    else
      puts 'No block'
    end
  end

  def arrive_train(train)
    trains << train
    puts "Train #{train} arrived to #{station_name}"
  end

  def show_trains
    puts trains
  end

  def show_trains_type
    puts 'Enter type cargo or pass'
    type = gets.chomp
    train_by_type = []
    trains.each do |train|
      puts train.type.to_s
      train_by_type << train if train.type == type
    end
    puts "the number of #{type} trains is #{train_by_type.length} "
  end

  def depart_train(train)
    if trains.include?(train)
      trains.delete(train)
    else
      puts "no #{train} on the station"
    end
  end

  def to_s
    "station's name is #{station_name}"
  end

  protected

  def validate!
    raise "Station can't be nil" if station_name.nil?
    raise 'Not more than 15 symbols' if station_name.length > 15
    raise 'Station should be letters' if station_name !~ NAME_STATION
    true
  end
end
