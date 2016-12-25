require "spec_helper"

describe CommonCore::ScoreReader do
  before :all do
    curriculum, scores = ['domain_order.csv', 'student_tests.csv'].map do |f|
      File.join(CommonCore::ROOT, 'data', f)
    end
    presenter = CommonCore::Presenter.new
    @reader = CommonCore::ScoreReader.new(curriculum, scores, presenter)
  end

  it "should open the curriculum file" do
    expect(@reader.curricula.keys).to eql ["K", "1", "2", "3", "4", "5", "6"]
    @reader.curricula.values.each do |value|
      expect(value).to be_instance_of Array
    end
  end
end
