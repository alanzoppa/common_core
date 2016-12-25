require "spec_helper"
require 'pry'

describe CommonCore do
  it "has a version number" do
    expect(CommonCore::VERSION).not_to be nil
  end

  it "loads the filesystem root" do
    expect(CommonCore::ROOT).not_to be nil
  end


  #it "accepts extra random stuff" do
    #p = CommonCore::Presentation.new(herp="derp")
  #end



  #it "spins up from arbitrary scores" do
    #student = CommonCore::Student.new("John McGuirk")
  #end
end
