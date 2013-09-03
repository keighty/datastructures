require 'spec_helper'

describe Madlibs do
  before do
    @mad = Madlibs.new
  end

  subject { @mad }

  it { should respond_to :get_words }

  xit "should ask user for an adjective" do
  end
end
