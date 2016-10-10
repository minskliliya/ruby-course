# class CargoCarriage
class CargoCarriage < Carriage
  attr_accessor :general_volume, :easy_volume

  def initialize(carriage, general_volume)
    @carriage = carriage
    super(number_carriage, 'cargo')
    @general_volume = general_volume
    @easy_volume = 0
  end

  def take_volume(easy_volume)
    self.easy_volume += easy_volume.to_i
  end

  def easy_volumes
    self.easy_volume
  end

  def free_volume
    general_volume.to_i - self.easy_volume.to_i
  end

  def to_s
    "carriage = #{carriage}, cargo,free = #{free_volume},easy = #{easy_volumes}"
  end
end
