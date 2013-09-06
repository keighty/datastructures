require 'spec_helper'

describe BigDigits do
  before do
    @bd = BigDigits.new
  end

  it 'should output 1' do
    expect(@bd.show(1)).to eq ONE
  end

  it 'should output 0' do
    expect(@bd.show(0)).to eq ZERO
  end

  it 'should output 10' do
    expect(@bd.show(10)).to eq TEN
  end
end
