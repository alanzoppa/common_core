class Student
  attr_reader :name, :scores
  def initialize(name, scores)
    @name = name
    @scores = CommonCore::InsensitiveHash.new
    scores.each do |key, value|
      @scores[key] = value.to_i
    end
  end

  def [](key)
    @scores[key]
  end

  def needs_lesson?(skill, level)
    level = level.is_a?(Symbol) ? level.to_s.to_i : level.to_i
    raise RangeError, "Skills must be integers zero or greater" if level < 0
    @scores[skill].to_i <= level.to_i
  end

end
