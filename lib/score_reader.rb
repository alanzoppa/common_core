require 'csv'

class ScoreReader
  attr_reader :curricula, :students

  def initialize(curricula, scores, presenter)
    @presenter = presenter
    @curricula = []

    CSV.foreach(curricula) do |key,*values|
      h = CommonCore::IndifferentHash.new
      h[key] = values
      @curricula << h
    end


    scores_matrix = CSV.read(scores)
    headers = scores_matrix[0]
    @students = scores_matrix[1..-1].map {|s| headers.zip(s).to_h}
    @students.map! do |student|
      name = student.delete("Student Name")
      CommonCore::Student.new(name, student)
    end
  end

  def sieve(student)
  end
end
