class QuickFind

  attr_accessor :find_array

  def initialize(size)
    @find_array = Array.new(size){ |index| index }
  end

  def find(p, q)
    location(p) == location(q)
  end

  def union(p, q)
    @find_array = create_union(p, q)
  end

  private

    def location(index)
      raise NotAnElement if @find_array[index].nil?
      return @find_array[index]
    end

    def create_union(p, q)
      target = location(p)
      goal = location(q)
      temp_array = []
      @find_array.each do |element|
        temp_array << (element == target ? goal : element)
      end
      return temp_array
    end
end

class NotAnElement < Exception
end