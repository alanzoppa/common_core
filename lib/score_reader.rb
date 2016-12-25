require 'csv'

class ScoreReader
  attr_reader :curricula, :students

  def initialize(curricula, scores, presenter)
    @presenter = presenter
    @curricula = []

    CSV.foreach(curricula) do |key,*values|
      h = CommonCore::InsensitiveHash.new
      h[key] = values
      @curricula << h.freeze
    end
    @curricula.freeze

    scores_matrix = CSV.read(scores)
    headers = scores_matrix[0]
    @students = scores_matrix[1..-1].map {|s| headers.zip(s).to_h}
    @students.map! do |student|
      name = student.delete("Student Name")
      CommonCore::Student.new(name, student)
    end
  end

  def sieve(student)
    @lesson_plan = []
    @curricula.each do |curriculum|
      grade = curriculum.keys.first
      lessons = curriculum[grade]
      grade_hash = CommonCore::InsensitiveHash.new
      grade_hash[grade] = []
      lessons.each do |lesson|
        if student.needs_lesson?(lesson, grade)
          grade_hash[grade] << lesson
        end
      end
      @lesson_plan << grade_hash unless grade_hash[grade].empty?
    end
    @lesson_plan 
  end
end
