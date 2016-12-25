require 'csv'

class ScoreReader
  attr_reader :curricula, :students

  def initialize(curricula, scores, presenter)
    @presenter = presenter
    @curricula = []

    CSV.foreach(curricula) do |grade, *lessons|
      @curricula << [grade, lessons]
    end
    @curricula.freeze

    scores_matrix = CSV.read(scores)
    headers = scores_matrix[0]
    @students = scores_matrix[1..-1].map {|s| headers.zip(s).to_h}
    @students.map! do |student|
      CommonCore::Student.new(student.delete("Student Name"), student)
    end
  end

  def sieve(student)
    @curricula.map do |grade, lessons|
      valid_lessons = lessons.select {|l| student.needs_lesson?(l, grade)}
      [grade, valid_lessons] unless valid_lessons.empty?
    end.compact
  end

end
