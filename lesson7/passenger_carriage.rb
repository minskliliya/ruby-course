class PassengerCarriage < Carriage

  attr_accessor :count_place, :easy_place


  def initialize(count_place)
    super("passenger")
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
    self.count_place - self.easy_place
  end  

end  