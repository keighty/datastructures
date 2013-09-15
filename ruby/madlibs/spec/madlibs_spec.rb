require 'spec_helper'

describe MadLibs do
  before (:each) { @mad = MadLibs.new }
  subject { @mad }

  context "when first created" do
    it "should be initialized with a game" do
      expect(@mad.game).to be_instance_of MadLibGame
    end
  end

  context "during play" do
    it { should respond_to :play }
    it "should ask for adjectives"
    it "should output a funny phrase"
  end

end
