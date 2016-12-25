require "spec_helper"
require 'pry'


describe CommonCore::Presentation do
  before :all do
    @p = CommonCore::Presentation.new
  end

  it "loads definitions with indifferent access" do
    expect( @p.definitions[:RL] ).to eql "Reading Literature"
    expect( @p.definitions["RL"] ).to eql "Reading Literature"
  end

  it "behaves like a hash" do
    expect( @p[:RL] ).to eql "Reading Literature"
    expect( @p["RL"] ).to eql "Reading Literature"
  end

  it "accepts extra random stuff" do
    p = CommonCore::Presentation.new(stuff: "things")
    expect( p[:stuff] ).to eql "things"
  end



  #it "spins up from arbitrary scores" do
    #student = CommonCore::Student.new("John McGuirk")
  #end
end
