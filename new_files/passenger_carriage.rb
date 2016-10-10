# class PassengerCarriage
class PassengerCarriage < Carriage
  attr_accessor :count_place, :easy_place

  def initialize(carriage, count_place)
    @carriage = carriage
    super(carriage, 'passenger')
    @count_place = count_place
    @easy_place = 0
  end

  def take_place
    self.easy_place += 1
  end

  def easy_places
    self.easy_place
  end

  def free_places
    count_place.to_i - self.easy_place.to_i
  end

  def to_s
    " carr = #{carriage} ,pass,free= #{free_places} ,easy= #{easy_places}"
  end
end
