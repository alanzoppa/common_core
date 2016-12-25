require 'csv'

class ScoreReader
  attr_reader :curricula, :students, :presenter

  def initialize(curricula, scores, presenter)
    scores_matrix = CSV.read(scores)

    @students = scores_matrix[1..-1].map do |student_data|
      student_hash = scores_matrix.first.zip(student_data).to_h
      CommonCore::Student.new(
        student_hash.delete("Student Name"),
        student_hash
      )
    end

    @curricula = CSV.read(curricula).map {|grade, *lessons| [grade, lessons] }
    @presenter = presenter
  end

  def sieve(student)
    @curricula.map do |grade, lessons|
      valid_lessons = lessons.select {|l| student.needs_lesson?(l, grade)}
      [grade, valid_lessons] unless valid_lessons.empty?
    end.compact
  end

  def lesson_plans!
    unless defined? @lesson_plans
      output = CommonCore::InsensitiveHash.new
      @students.each {|s| output[s.name] = sieve(s)}
      @lesson_plans = output
    end
    @lesson_plans
  end

end
