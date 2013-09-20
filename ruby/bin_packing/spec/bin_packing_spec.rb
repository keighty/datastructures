require 'spec_helper'

describe BinPacking do
  before (:each) { @bp = BinPacking.new }
  subject { @bp }
  it "should process a 9 digit string" do
    @bp.id_contents("5 10 5 20 10 5 10 20 10")
    p @bp.bins
  end
  it "should output bin ids"
  it "should output required moves"
end
