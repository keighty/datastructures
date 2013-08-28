require 'test_helper'

describe QuickFind do
  before do
    @size = 10
    @quick_find = QuickFind.new(@size)
  end

  it "responds to find" do
    @quick_find.respond_to?(:find).must_equal true
  end

  it "responds to union" do
    @quick_find.respond_to?(:union).must_equal true
  end

  it "raises an exception for out of bounds" do
    assert_raises(NotAnElement) { @quick_find.find(1, @size + 1) }
    assert_raises(NotAnElement) { @quick_find.union(1, @size + 1) }
  end

  describe "union" do
    before { @quick_find.union(1, 2) }

    it 'connected indexes are connected' do
      @quick_find.find(1, 2).must_equal true
    end

    it 'unconnected indexes are not connected' do
      @quick_find.find(1, 3).wont_equal true
    end
  end

  describe 'find' do
    before do
      @quick_find.union(1, 2)
    end

    it 'should connect 1 and 2' do
      @quick_find.find(1, 2).must_equal true
    end

    it 'should not connect 1 and 3' do
      @quick_find.find(1, 3).wont_equal true
    end

    it 'should connect 1 and 4' do
      @quick_find.union(2, 4)
      @quick_find.find(1, 4).must_equal true
    end

    it 'should connect 1 and 9' do
      @quick_find.union(2, 4)
      @quick_find.union(4, 9)
      @quick_find.find(1, 9).must_equal true
    end

    it 'should handle find queries mixed with union commands' do
      @quick_find.union(3, 1)
      @quick_find.union(4, 3)
      @quick_find.find(3, 7).must_equal false
      @quick_find.union(3, 7)
      @quick_find.find(1, 7).must_equal true
      @quick_find.union(2, 8)
      @quick_find.find(1, 8).must_equal true
      @quick_find.union(7, 3)
    end
  end
end