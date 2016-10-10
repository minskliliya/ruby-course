# class Carriage
class Carriage
  include CompanyTrain

  attr_accessor :type, :number_carriage

  def initialize(number_carriage, type)
    @type = type
    @number_carriage = number_carriage
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
