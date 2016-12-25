class Student
  def initialize(name, scores)
    @name = name
    @scores = CommonCore::IndifferentHash.new
    scores.each do |key, value|
      @scores[key] = value.to_i
    end
  end

  def [](key)
    @scores[key]
  end

end
