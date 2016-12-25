class Student
  def initialize(name, **kwargs)
    @name = name
    @scores = CommonCore::IndifferentHash.new
    #kwargs.each do |key, value|
      #@scores[key] 
    #end
  end
end
