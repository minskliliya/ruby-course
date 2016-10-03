class CargoCarriage < Carriage

  attr_accessor :general_volume, :easy_volume

  def initialize(general_volume)
    super("cargo")
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
    self.general_volume - self.easy_volume
  end  
end