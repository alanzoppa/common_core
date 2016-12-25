require "spec_helper"

describe CommonCore::ScoreReader do
  before :all do
    curriculum, scores = ['domain_order.csv', 'student_tests.csv'].map do |f|
      File.join(CommonCore::ROOT, 'data', f)
    end
    presenter = CommonCore::Presenter.new
    @reader = CommonCore::ScoreReader.new(curriculum, scores, presenter)
    @student = CommonCore::Student.new(
      "John McGuirk", RF:"2", RL:"3", RI:'K', L:"3"
    )
  end

  it "should open the curriculum file" do
    expect(@reader.curricula.map {|c| c.keys.first }).to eql ["K", "1", "2", "3", "4", "5", "6"]
    @reader.curricula.each do |value|
      expect(value).to be_instance_of CommonCore::InsensitiveHash
    end
  end


  it "should initialize students" do
    @reader.students.each do |s|
      expect(s).to be_instance_of CommonCore::Student
    end
  end

  #it "should generate a lesson plan" do
    #plan = @reader.sieve(@student)
  #end

end
