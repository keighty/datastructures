require 'test_helper'

describe WeightedQuickUnion do
  before do
    @size = 10
    @wqu = WeightedQuickUnion.new(@size)
  end

  it "responds to find" do
    @wqu.respond_to?(:find).must_equal true
  end

  it "should respond to union" do
    @wqu.respond_to?(:union).must_equal true
  end

  it "raises an exception for index out of bounds" do
    assert_raises(NotAnElement) { @wqu.find(1, @size + 1) }
    assert_raises(NotAnElement) { @wqu.union(1, @size + 1) }
  end

  describe "union" do
    before { @wqu.union(1, 2) }

    it 'connected indexes are connected' do
      @wqu.find(1, 2).must_equal true
    end

    it 'unconnected indexes are not connected' do
      @wqu.find(1, 3).wont_equal true
    end
  end

  describe 'find' do
    before do
      @wqu.union(1, 2)
    end

    it 'should connect 1 and 2' do
      @wqu.find(1, 2).must_equal true
    end

    it 'should not connect 1 and 3' do
      @wqu.find(1, 3).wont_equal true
    end

    it 'should connect 1 and 4' do
      @wqu.union(2, 4)
      @wqu.find(1, 4).must_equal true
    end

    it 'should connect 1 and 9' do
      @wqu.union(2, 4)
      @wqu.union(4, 9)
      @wqu.find(1, 9).must_equal true
    end

    it 'should handle find queries mixed with union commands' do
      @wqu.union(3, 1)
      @wqu.union(4, 3)
      @wqu.find(3, 7).must_equal false
      @wqu.union(3, 7)
      @wqu.find(1, 7).must_equal true
      @wqu.union(2, 8)
      @wqu.find(1, 8).must_equal true
      @wqu.union(7, 3)
    end
  end
end