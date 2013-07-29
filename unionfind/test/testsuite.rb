require 'test_helper'

class UnionFindTest < Minitest::Test

  def setup
    @size = 10
    @wqu = WeightedQuickUnion.new(@size)
  end

  def test_respond_to_find
    @wqu.respond_to?(:find).must_equal true
  end

  def test_respond_to_union
    @wqu.respond_to?(:union).must_equal true
  end

  def test_raises_an_exception
    assert_raises(NotAnElement) { @wqu.find(1, @size + 1) }
    assert_raises(NotAnElement) { @wqu.union(1, @size + 1) }
  end

  class UnionTest < Minitest::Test
    def setup
      @wqu.union(1, 2)
    end

    def test_indexes_are_connected
      @wqu.find(1, 2).must_equal true
    end

    def test_indexes_are_not_connected
      @wqu.find(1, 3).wont_equal true
    end
  end

  class FindTest < Minitest::Test
    def setup
      @wqu.union(1, 2)
    end

    def test_should_connect_1_and_2
      @wqu.find(1, 2).must_equal true
    end

    def test_should_not_connect_1_and_3
      @wqu.find(1, 3).wont_equal true
    end

    def test_should_connect_1_and_4
      @wqu.union(2, 4)
      @wqu.find(1, 4).must_equal true
    end

    def test_should_connect_1_and_9
      @wqu.union(2, 4)
      @wqu.union(4, 9)
      @wqu.find(1, 9).must_equal true
    end

    def test_should_handle_find_
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