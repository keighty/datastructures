require 'spec_helper'

describe Arbitrage do
  before (:each) { @arb = Arbitrage.new }
  subject { @arb }

  it "should process string input and get N" do
    @arb.process_input("14")
    expect(@arb.n).to eq 14
  end

  it "should process string input and get conversions" do
    @arb.process_input("14\n1.3 5.6")
    expect(@arb.conversions).to eq [[1.3, 5.6]]
    @arb.process_input("14\n1.3 5.6\n4.3 8.9")
    expect(@arb.conversions).to eq [[1.3, 5.6], [4.3, 8.9]]
  end
end
