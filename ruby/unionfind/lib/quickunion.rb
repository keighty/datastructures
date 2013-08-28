class QuickUnion
  def initialize(size)
    @find_array = Array.new(size){ |index| index }
  end

  # check if p and q have the same root
  def find(p, q)
    verify(p, q)
    root(p) == root(q)
  end

  # set id of p's root to the id of q's root
  def union(p, q)
    verify(p, q)
    @find_array[root(p)] = root(q)
  end

  private
    def root(index)
      # get root until root(index) == index
      if @find_array[index] == index
        return index
      else
        root(@find_array[index])
      end
    end

    def verify(p, q)
      raise NotAnElement if @find_array[p].nil?
      raise NotAnElement if @find_array[q].nil?
    end
end

class NotAnElement < Exception
end