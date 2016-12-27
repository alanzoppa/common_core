require 'csv'


class Presenter
  attr_reader :definitions

  # Accepts any number of key/value pairs as {dehumanized: humanized}
  # i.e. {RL: "Reading Literature"}

  def initialize(**kwargs)
    @definitions = CommonCore::InsensitiveHash.new
    definitions = File.join(CommonCore::ROOT, 'data', 'definitions.csv')
    CSV.foreach(definitions) do |key,value|
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

  def to_table(input)
    h, v = [ENV['HORIZONTAL_CHAR'] || '═', ENV['VERTICAL_CHAR'] || '║']
    out = []
    out << h * 79
    out << "#{v}#{'NAME'.center(38)}#{v}#{'LESSON PLAN'.center(38)}#{v}"
    out << h * 79
    input.each do |name, lessons|
      centered_name = name.ljust(20).center(38)
      lessons = as_array_of_lessons(lessons).join(', ').ljust(30).center(38)
      out << "#{v}#{centered_name}#{v}#{lessons}#{v}"
    end
    out << h * 79
    out.join("\n")
  end

  def to_csv(input)
    CSV.generate do |csv|
      csv << [
        "Student", "Lesson 1", "Lesson 2", "Lesson 3", "Lesson 4", "Lesson 5"
      ]
      input.each do |name, lessons|
        csv << [name, *as_array_of_lessons(lessons, 5)]
      end
    end
  end

end
