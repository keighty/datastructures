require 'spec_helper'

describe Blocks do
  before (:each) { @bg = Blocks.new; @bg.start(5) }
  subject { @bg }

  it "should output the piles of blocks" do
    expect(@bg.show_piles).to eq "0: 0\n1: 1\n2: 2\n3: 3\n4: 4\n"
  end

  it "should move a onto b" do
    @bg.arm(%w{move 1 onto 2})
    expect(@bg.show_piles).to eq "0: 0\n1: \n2: 2 1\n3: 3\n4: 4\n"
  end

  it "should move a onto b if a and b are buried" do
    @bg.arm(%w{move 1 onto 2})
    @bg.arm(%w{move 4 onto 3})
    @bg.arm(%w{move 2 onto 3})
    expect(@bg.show_piles).to eq "0: 0\n1: 1\n2: \n3: 3 2\n4: 4\n"
  end

  it "should move a over b" do
    @bg.arm(%w{move 1 onto 2})
    @bg.arm(%w{move 2 over 0})
    expect(@bg.show_piles).to eq "0: 0 2\n1: 1\n2: \n3: 3\n4: 4\n"
  end

  it "should pile a onto b" do
    @bg.arm(%w{move 1 onto 2})
    @bg.arm(%w{pile 2 onto 3})
    expect(@bg.show_piles).to eq "0: 0\n1: \n2: \n3: 3 2 1\n4: 4\n"
  end

  it "should pile a over b" do
    @bg.arm(%w{move 1 onto 2})
    @bg.arm(%w{move 4 onto 3})
    @bg.arm(%w{pile 2 over 3})
    expect(@bg.show_piles).to eq "0: 0\n1: \n2: \n3: 3 4 2 1\n4: \n"
  end

  it "should ignore illegal commands" do
    @bg.arm(%w{move 1 onto 1})
    expect(@bg.show_piles).to eq "0: 0\n1: 1\n2: 2\n3: 3\n4: 4\n"
    @bg.arm(%w{move 1 onto 2})
    @bg.arm(%w{move 2 onto 1})
    expect(@bg.show_piles).to eq "0: 0\n1: \n2: 2 1\n3: 3\n4: 4\n"
  end

  it "should quit" do
    @bg.arm(%w{quit})
  end
  # xit "should output the Blocks game with no trailing spaces" do
  #   @bg.game_array = [[], [1, 0, 2], []]
  #   expect(@bg.show_game).to eq "0:\n1: 1 0 2\n2:\n"
  # end
end
