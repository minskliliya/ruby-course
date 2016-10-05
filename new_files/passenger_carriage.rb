class PassengerCarriage < Carriage

  attr_accessor :count_place, :easy_place

  def initialize(number_carriage,count_place)
    @number_carriage = number_carriage
    super(number_carriage, "passenger")
    @count_place = count_place
    @easy_place = 0
  end 

  def take_place
    self.easy_place += 1
  end  

  def count_easy_place
    self.easy_place 
  end
  
  def count_free_place
    self.count_place.to_i - self.easy_place.to_i
  end

  def to_s 
    "number carriage = #{number_carriage}, type = passenger, free_place = #{count_free_place}, easy_place = #{count_easy_place}"  
  end     
end  