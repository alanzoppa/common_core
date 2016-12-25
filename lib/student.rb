class Student
  def initialize(name, **kwargs)
    @name = name
    @scores = CommonCore::IndifferentHash.new
    kwargs.each do |key, value|
      @scores[key] = value.to_i
    end
  end

  def [](key)
    @scores[key]
  end

end
