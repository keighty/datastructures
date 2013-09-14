require 'spec_helper'

describe Filemaker do
  FILENAME = "./data/testfile.csv"

  before do
    @fm = Filemaker.new(1000)
  end

  it "should respond to :save_file" do
    expect(@fm.respond_to?(:save_file)).to be_true
  end
end