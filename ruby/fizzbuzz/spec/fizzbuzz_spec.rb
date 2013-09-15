require 'spec_helper'

describe Fizzbuzz do
  before do
    @fb = Fizzbuzz.new
  end

  it "should check that 3 outputs fizz" do
    expect(@fb.check_mod(3)).to eq "fizz"
  end

  it "should check that 5 outputs buzz" do
    expect(@fb.check_mod(5)).to eq "buzz"
  end

  it "should check that 15 outputs fizzbuzz" do
    expect(@fb.check_mod(15)).to eq "fizzbuzz"
  end

  it "should return the number if not fizz or buzz" do
    expect(@fb.check_mod(2)).to eq "2"
  end
end
