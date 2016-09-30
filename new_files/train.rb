class Train

  attr_accessor :number, :type, :carriage_number, :speed, :route, :current_station, :next_station


  def initialize(number, type,carriage_number)
    @number = number
    @type = type
    @carriage_number = carriage_number
    @speed = 0
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
    puts self.carriage_number
  end  

  def add_carriage
    if self.speed == 0
      self.carriage_number += 1
    else
      puts "stop train before add carriage"
    end
  end  

  def delete_carriage
    if self.speed == 0
      self.carriage_number -= 1
    else
      puts "stop train before delete carriage"
    end
  end  
        
  def take_route(route)
    self.route = route
    self.current_station = self.route.stations_route[0]
    self.route.stations_route[0].arrive_train(self)
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
    "This train's number is #{self.number} and type is #{self.type} and number carriage is #{self.carriage_number}"
  end  
end

