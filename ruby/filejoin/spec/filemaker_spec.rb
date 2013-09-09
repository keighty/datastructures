require 'spec_helper'

##This is a good mocking exercise

describe Filemaker do
  FILENAME = "./data/testfile.csv"

  before do
    @fm = Filemaker.new(1000, FILENAME)
  end

  after do
    File.delete(FILENAME)
  end

  it "should respond to :save_array" do
    expect(@fm.respond_to?(:save_array)).to be_true
  end
end