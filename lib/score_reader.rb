require 'csv'

class ScoreReader
  attr_reader :curricula, :students

  def initialize(curriculum, scores, presenter)
    @presenter = presenter
    @curricula = CommonCore::IndifferentHash.new

    CSV.foreach(curriculum) do |key,*values|
      @curricula[key] = values
    end

    scores_matrix = CSV.read(scores)
    headers = scores_matrix[0]
    @students = scores_matrix[1..-1].map {|s| headers.zip(s).to_h}
    @students.map! do |student|
      name = student.delete("Student Name")
      CommonCore::Student.new(name, student)
    end
  end
end
