require 'csv'

class Presenter
  attr_reader :definitions

  # Accepts any number of key/value pairs as {dehumanized: humanized}
  # i.e. {RL: "Reading Literature"}

  def initialize(**kwargs)
    @definitions = CommonCore::IndifferentHash.new
    CSV.foreach(File.join(CommonCore::ROOT, 'data', 'definitions.csv')) do |key,value|
      @definitions[key] = value
    end
    @definitions.merge!(kwargs)
  end

  def [](key)
    @definitions[key]
  end

end
