class BinPacking
  attr_accessor :bins

  def initialize
    @bins = []
  end

  Bin = Struct.new(:browns, :greens, :clears, :initial)

  def id_contents(input)
    temp = input.split(" ")
    until temp.empty?
      bin = Bin.new
      bin.browns = temp.shift
      bin.greens = temp.shift
      bin.clears = temp.shift
      bins << bin
    end
  end

  def flag_bins
    # check all brown bottles
    # flag the bin with the most brown bottles
  end
end