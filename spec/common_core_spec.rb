require "spec_helper"

describe CommonCore do
  it "has a version number" do
    expect(CommonCore::VERSION).not_to be nil
  end

  it "loads the filesystem root" do
    expect(CommonCore::ROOT).not_to be nil
  end

end
