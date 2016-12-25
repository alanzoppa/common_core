require "spec_helper"
require 'pry'


describe CommonCore::Student do
  before :all do
    @student = CommonCore::Student.new(
      "John McGuirk", RF:"2", RL:"3", RI:'K', L:"3"
    )
  end

  it "unpacks and stores scores" do
    expect( @student[:RF] ).to eql 2
    expect( @student[:RI] ).to eql 0
  end

  it "can test the need for a defined skill" do
    [
      [:K, false],
      [ 0, false],
      [ 1, false],
      [ 2, true ],
      [ 3, true ],
      [ 4, true ],
      [ 5, true ],
    ].each do |level, bool|
      expect( @student.needs_lesson?("RF", level.to_s) ).to be bool
      expect( @student.needs_lesson?(:RF, level) ).to be bool
    end
  end

  it "always returns true for an undefined skill" do
    expect( @student.needs_lesson?(:bogus, 1) ).to be true
  end

  it "blows up if the level is negative" do
    expect {@student.needs_lesson?(:bogus, -1) }.to raise_error RangeError
  end



end
