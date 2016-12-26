require "spec_helper"
require 'pry' 

describe CommonCore::Presenter do
  before :all do
    @p = CommonCore::Presenter.new

    curriculum, scores = ['domain_order.csv', 'student_tests.csv'].map do |f|
      File.join(CommonCore::ROOT, 'spec', f)
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
      #puts @csv_output
    end
  end

  describe "to_table" do
    before :all do
      @table_output = @reader.presenter.to_table(@reader.lesson_plans!)
      @table_output_rows = @table_output.split("\n")
    end

    it "should generate a table" do
      expect(@table_output_rows[3]).to eql(
        "║         Albin Stanton                ║    K.RI, 1.RI, 2.RF, 2.RI, 3.RF      ║"
      )
    end
  end

end
