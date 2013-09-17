require 'spec_helper'

describe Blocks do
  before (:each) { @bg = Blocks.new(3) }
  subject { @bg }

  it "should output the piles of blocks" do
    expect(@bg.show_piles).to eq "0: 0\n1: 1\n2: 2\n"
  end

  it "should move a onto b" do
    @bg.arm(%w{move 1 onto 2})
    expect(@bg.show_piles).to eq "0: 0\n1: \n2: 2 1\n"
  end
# puts block a onto the top of the stack containing block b, after returning any blocks that are stacked on top of block a to their initial positions.
  it "should move a over b" do
    @bg.arm(%w{move 1 onto 2})
    @bg.arm(%w{move 2 over 0})
    expect(@bg.show_piles).to eq "0: 0 2\n1: 1\n2: \n"
  end

  # it "should move a over b"
  # it "should pile a onto b"
  # it "should pile a over b"
  # it "should ignore illegal commands"
  # it "should quit"
  # xit "should output the Blocks game with no trailing spaces" do
  #   @bg.game_array = [[], [1, 0, 2], []]
  #   expect(@bg.show_game).to eq "0:\n1: 1 0 2\n2:\n"
  # end
end
