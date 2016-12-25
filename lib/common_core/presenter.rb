require 'csv'


class Presenter
  attr_reader :definitions

  # Accepts any number of key/value pairs as {dehumanized: humanized}
  # i.e. {RL: "Reading Literature"}

  def initialize(**kwargs)
    @definitions = CommonCore::InsensitiveHash.new
    CSV.foreach(File.join(CommonCore::ROOT, 'data', 'definitions.csv')) do |key,value|
      @definitions[key] = value
    end
    @definitions.merge!(kwargs)
  end

  def [](key)
    @definitions[key]
  end

  def as_array_of_lessons(curriculum, length=5)
    output = []
    curriculum.each do |grade, lessons|
      lessons.each do |lesson|
        output << "#{grade}.#{lesson}"
        return output if output.length == length
      end
    end
    output
  end

  def print_table(input)
    h, v = [ENV['HORIZONTAL_CHAR'] || '═', ENV['VERTICAL_CHAR'] || '║']
    puts h * 79
    puts "#{v}#{'NAME'.center(38)}#{v}#{'LESSON PLAN'.center(38)}#{v}"
    puts h * 79
    input.each do |name, lessons|
      puts "#{v}#{name.ljust(20).center(38)}#{v}#{as_array_of_lessons(lessons).join(', ').ljust(30).center(38)}#{v}"
    end
    puts h * 79
  end

end
