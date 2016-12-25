require 'csv'

class Presentation
  attr_reader :definitions

  # Accepts any number of key/value pairs as {dehumanized: humanized}
  # i.e. {RL: "Reading Literature"}

  def initialize(**kwargs)
    @definitions = Hash.new
    @definitions.default_proc = proc {|h, k| h.key?(k.to_s) ? h[k.to_s] : nil}
    CSV.foreach(File.join(CommonCore::ROOT, 'data', 'definitions.csv')) do |key,value|
      @definitions[key] = value
    end
    @definitions.merge!(kwargs)
  end

  def [](key)
    return @definitions[key]
  end



end
