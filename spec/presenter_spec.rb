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

  describe "print_table" do
    specify { expect { @reader.presenter.print_table(@reader.lesson_plans!) }.to output.to_stdout }
  end

end
