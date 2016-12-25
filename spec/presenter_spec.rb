require "spec_helper"
require 'pry'


describe CommonCore::Presenter do
  before :all do
    @p = CommonCore::Presenter.new
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

end