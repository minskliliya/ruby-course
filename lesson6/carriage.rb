class Carriage 

  include CompanyTrain
  
  attr_reader :type

  def initialize(type)
    validate!
    @type = type
  end  

  def valid?
    validate!
  rescue
    false
  end

  protected

  def validate!
    raise "Type can't be nil" if type.nil?
    raise "Type of train has invalid format" if type !~ Train::TRAIN_TYPE
    true
  end
end  