# Weighted quick-union.
#
# Modify quick-union to avoid tall trees.
#
# Keep track of sz of each component.
#
# Balance by linking small tree below large one.

class WeightedQuickUnion

  attr_accessor :find_array

  def initialize(sz)
    @find_array = Array.new(sz) { |i| i }
    @size = Array.new(sz, 0)
  end

  def find(p, q)
    verify(p, q)
    root(p) == root(q)
  end

  # merge smaller tree into larger tree
  # update the sz[] array.
  def union(p, q)
    verify(p, q)
    root_p = root(p)
    root_q = root(q)

    if @size[root_p] < @size[root_q]
      @find_array[root_p] = root_q
      @size[root_q] += @size[root_p]
    else
      @find_array[root_q] = root_p
      @size[root_p] += @size[root_q]
    end
  end

  private

    def verify(p, q)
      raise NotAnElement if @find_array[p].nil?
      raise NotAnElement if @find_array[q].nil?
    end

    # get root until root(index) == index
    def root(index)
      if @find_array[index] == index
        return index
      else
        root(@find_array[index])
      end
    end
end

class NotAnElement < Exception
end