module Accessors 
  def self.included(base)
  	base.extend ClassMethods
  end  

  module ClassMethods
    def attr_accessor_with_history(*parameters)
      parameters.each do |parameter| 
        var_parameter = "@#{parameter}".to_sym
        define_method(parameter) { instance_variable_get(var_parameter) }
        define_method("#{parameter}=".to_sym) { |value| instance_variable_set(var_parameter, value) }
      end
    end
  
    
    def strong_attr_accessor(var_parameter, var_class)
      var, var_get, var_set = ["@#{var_name}", var_name, "#{var_name}="].map(&:to_sym)

      define_method(var_get) { instance_variable_get(var) }

      define_method(var_set) do |value|
        unless value.is_a?(var_class)
          raise TypeError, "#{var_name} should be instance of #{var_class}!"
        end
        instance_variable_set(var, value)
      end
    end
  

  end



end      

    
      

