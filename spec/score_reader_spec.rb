require "spec_helper"

describe CommonCore::ScoreReader do
  before :all do
    curriculum, scores = ['domain_order.csv', 'student_tests.csv'].map do |f|
      File.join(CommonCore::ROOT, 'spec', f)
    end
    presenter = CommonCore::Presenter.new
    @reader = CommonCore::ScoreReader.new(curriculum, scores, presenter)
    @student = CommonCore::Student.new(
      "John McGuirk", RF:"2", RL:"3", RI:'K', L:"3"
    )
  end

  it "has a presenter" do
    expect(
      @reader.instance_variable_get(:@presenter)
    ).to be_instance_of CommonCore::Presenter
  end

  it "should open the curriculum file" do
    expect(@reader.curricula.map {|grade, *lessons| grade }).to eql ["K", "1", "2", "3", "4", "5", "6"]
    @reader.curricula.each do |grade, *lessons|
      expect(lessons).to be_instance_of Array
    end
  end


  it "should initialize students" do
    expect(@reader.students.first.name).to eql "Albin Stanton"
    expect(@reader.students.first.scores).to eql({"RF"=>2, "RL"=>3, "RI"=>0, "L"=>3})
    @reader.students.each do |s|
      expect(s).to be_instance_of CommonCore::Student
    end
  end

  it "should generate a lesson plan" do
    expect(@reader.sieve(@student)).to eql [
      ["K", ["RI"]],
      ["1", ["RI"]],
      ["2", ["RF", "RI"]],
      ["3", ["RF", "RL", "RI", "L"]],
      ["4", ["RI", "RL", "L"]],
      ["5", ["RI", "RL", "L"]],
      ["6", ["RI", "RL"]]
    ]
  end

  it "should ignore empty rows" do
    student = CommonCore::Student.new(
      "John McGuirk", RF:"5", RL:"5", RI:'5', L:"4"
    )
    expect(@reader.sieve(student)).to eql(
      [["4", ["L"]], ["5", ["RI", "RL", "L"]], ["6", ["RI", "RL"]]]
    )
  end

  it "should sieve and cache all students" do
    expect( @reader.instance_variable_get(:@lesson_plans) ).to be nil
    plans = @reader.lesson_plans!
    expect(plans.keys.length).to be >= 30
    expect(plans).to be_instance_of CommonCore::InsensitiveHash
    expect(
      @reader.instance_variable_get(:@lesson_plans)
    ).to be_instance_of CommonCore::InsensitiveHash
  end

  it "should give you nothing if you score higher than a known grade level" do
    expect(
      @reader.lesson_plans!.find {|name, *scores| name == 'George Harrison'}
    ).to eql(
      ["George Harrison", [["3", ["RF"]], ["6", ["RI"]]]]
    )
  end

  it "Not fill up all five columns if it runs out of stuff" do
    expect(
      @reader.lesson_plans!.find {|name, *scores| name == 'John Lennon'}
    ).to eql(
      ["John Lennon", [["3", ["RF"]], ["5", ["L"]], ["6", ["RI", "RL"]]]]
    )
  end



end
