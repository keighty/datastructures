require 'spec_helper'

describe ThreeNPlusOne do
  before (:each) { @tnp1 = ThreeNPlusOne.new(22) }

  it "should return a sequence" do
    expect(@tnp1.sequence).to eq [22, 11, 34, 17, 52, 26, 13, 40, 20, 10, 5, 16, 8, 4, 2, 1]
  end

  it "should return a sequence number" do
    expect(@tnp1.sequence_number).to eq 16
  end

end
