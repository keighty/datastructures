require 'spec_helper'

describe ThreeNPlusOneMax do
  before (:each) { @max = ThreeNPlusOneMax.new }

  it "should process a line of input" do
    STDOUT.should_receive(:puts).with("1 10 20")
    @max.process(input: "1 10")
  end

  it "should process a file" do
    # STDIN.should_receive(:read).and_return("string")
    executable = File.join(File.dirname(__FILE__), '..', 'lib/three_n_plus_one_max')
    data = File.join(File.dirname(__FILE__), '..', 'data/test_input.txt')
    %x{ruby #{executable} #{data}}
  end

end
