require 'spec_helper'

describe Palindrome do

  it "should check if abba is a palindrome" do
    @pal = Palindrome.new("abba")
    expect(@pal.palindrome?).to be_true
  end

  it "should check if boswell is a palindrome" do
    @pal = Palindrome.new("boswell")
    expect(@pal.palindrome?).to be_false
  end

  it "should check if AbBa is a palindrome" do
    @pal = Palindrome.new("AbBa")
    expect(@pal.palindrome?).to be_true
  end
end
