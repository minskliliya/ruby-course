# class Carriage
class Carriage
  include CompanyTrain

  attr_accessor :type, :carriage

  def initialize(carriage, type)
    @type = type
    @carriage = carriage
    validate!
  end

  def valid?
    validate!
  rescue
    false
  end

  protected

  def validate!
    raise 'Type of train has invalid format' if type !~ Train::TRAIN_TYPE
    true
  end
end
