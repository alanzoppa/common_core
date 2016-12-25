require "spec_helper"
require 'pry'


describe CommonCore::Student do
  before :all do
    #@p = CommonCore::Presentation.new
  end

  it "unpacks and stores scores" do
    student = CommonCore::Student.new(
      "John McGuirk", RF:"2", RL:"3", RI:'K', L:"3"
    )
    expect( student[:RF] ).to eql 2
    expect( student[:RI] ).to eql 0
  end
end
