require 'spec_helper'

describe BinPacking do
  before (:each) { @bp = BinPacking.new }
  subject { @bp }
  it "should process a 9 digit string" do
    @bp.id_contents("5 10 5 20 10 5 10 20 10")
    p @bp.bins
  end

  it "should pick the arrangement with the fewest moves" do
    @bp.id_contents("5 10 5 20 10 5 10 20 10")
    expect(@bp.winner).to eq "CBG: 50"
  end

  it "should output required moves" do
    @bp = BinPacking.new
    @bp.id_contents("1 2 3 4 5 6 7 8 9")
    expect(@bp.winner).to eq "BGC: 30"
  end
end
