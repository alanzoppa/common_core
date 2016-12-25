class Student
  attr_reader :name, :scores

  def initialize(name, scores)
    @name = name
    integerized_scores = scores.to_a.map {|k,v| [k,v.to_i]}
    @scores = CommonCore::InsensitiveHash[integerized_scores]
  end

  def [](key)
    @scores[key]
  end

  def needs_lesson?(skill, level)
    level = level.is_a?(Symbol) ? level.to_s.to_i : level.to_i
    raise RangeError, "Skills must be integers zero or greater" if level < 0
    @scores[skill].to_i <= level
  end

end
