require 'csv'

class ScoreReader
  attr_reader :curricula

  def initialize(curriculum, scores, presenter)
    @presenter = presenter
    @curricula = CommonCore::IndifferentHash.new

    CSV.foreach(curriculum) do |key,*values|
      @curricula[key] = values
    end

  end
end