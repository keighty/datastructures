require 'spec_helper'


describe Filejoin do

  TESTFILE10 = "data/testfile10.csv"
  TESTFILE100 = "data/testfile100.csv"
  TESTFILE1000 = "data/testfile1000.csv"

  before do
    @fj = Filejoin.new
  end

  it 'should take commandline args' do
    fake_stdin(TESTFILE10) do
      input = File.read(TESTFILE10)
      input.should match /0, 23/
    end
  end

end
