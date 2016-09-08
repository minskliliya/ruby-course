module CompanyTrain

  def put_company(name)
    self.name_company = name 
  end

  def company_train
    self.name_company
  end 

  protected
  attr_accessor :name_company

end  

