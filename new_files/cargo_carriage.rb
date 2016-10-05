class CargoCarriage < Carriage

  attr_accessor :general_volume, :easy_volume

  def initialize(number_carriage, general_volume)
    @number_carriage = number_carriage
    super(number_carriage, "cargo")
    @general_volume = general_volume
    @easy_volume = 0    
  end  

  def take_volume(easy_volume)
    self.easy_volume += easy_volume 
  end

  def show_easy_volume
    self.easy_volume
  end  

  def free_volume
    self.general_volume.to_i- self.easy_volume.to_i
  end  

  def to_s 
    "number carriage = #{number_carriage}, type = cargo, free_volume = #{free_volume}, easy_volume = #{show_easy_volume}"  
  end  
end