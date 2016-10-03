class Carriage 

  include CompanyTrain

  attr_accessor :type

  def initialize(type)
    @type = type
    validate!
  end  

  def valid?
    validate!
  rescue
    false
  end

  protected

  def validate!
    raise "Type of train has invalid format" if type !~ Train::TRAIN_TYPE
    true
  end


end  