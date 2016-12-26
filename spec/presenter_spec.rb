require "spec_helper"
require 'pry'


describe CommonCore::Presenter do
  before :all do
    @p = CommonCore::Presenter.new

    curriculum, scores = ['domain_order.csv', 'student_tests.csv'].map do |f|
      File.join(CommonCore::ROOT, 'data', f)
    end
    @reader = CommonCore::ScoreReader.new(curriculum, scores, @p)
  end

  it "loads definitions with indifferent access" do
    expect( @p.definitions[:RL] ).to eql "Reading Literature"
    expect( @p.definitions["RL"] ).to eql "Reading Literature"
  end

  it "behaves like a hash" do
    expect( @p[:RL] ).to eql "Reading Literature"
    expect( @p["RL"] ).to eql "Reading Literature"
  end

  it "accepts extra keyword arguments" do
    p = CommonCore::Presenter.new(stuff: "things")
    expect( p[:stuff] ).to eql "things"
  end

  describe "to_csv" do
    before :all do
      @csv_output = @reader.presenter.to_csv(@reader.lesson_plans!)
      @csv_as_matrix = @csv_output.split("\n").map(&:parse_csv)
    end

    it "should be a 6xn matrix where n >= 2" do
      expect( @csv_as_matrix.length ).to be >= 2
      expect( @csv_as_matrix[1..-1].any? {|arr| arr.length == 6 } ).to be true
    end

    it "should generate CSV output" do
      puts @csv_output
    end
  end

  describe "print_table" do
    specify { expect { @reader.presenter.print_table(@reader.lesson_plans!) }.to output.to_stdout }
  end

end
