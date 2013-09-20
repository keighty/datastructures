class BinPacking
  attr_accessor :bins

  def initialize
    @bins = []
  end

  def id_contents(input=ARGF.read)
    temp = input.split(" ")
    until temp.empty?
      bin = Bin.new
      bin.browns = temp.shift.to_i
      bin.greens = temp.shift.to_i
      bin.clears = temp.shift.to_i
      bins << bin
    end
  end

  def winner
    bgc = total - bins[0].browns - bins[1].greens - bins[2].clears
    bcg = total - bins[0].browns - bins[1].clears - bins[2].greens
    cbg = total - bins[0].clears - bins[1].browns - bins[2].greens
    gbc = total - bins[0].greens - bins[1].browns - bins[2].clears
    cgb = total - bins[0].clears - bins[1].greens - bins[2].browns
    gcb = total - bins[0].greens - bins[1].clears - bins[2].browns

    possibles = {}
    possibles[bgc] ||= "BGC"
    possibles[bcg] ||= "BCG"
    possibles[cbg] ||= "CBG"
    possibles[gbc] ||= "GBC"
    possibles[cgb] ||= "CGB"
    possibles[gcb] ||= "GCB"
    winner = possibles.keys.sort.first
    "#{possibles[winner]}: #{winner}"
  end

  def show_bins
    bins.each do |bin|
      puts bin.to_s
    end
  end

  private
    def total
      sum = 0
      bins.each do |bin|
        sum += bin.moves
      end
      sum
    end
end

class Bin
  attr_accessor :browns, :greens, :clears

  def to_s
    "B: #{browns}\nG: #{greens}\nC: #{clears}"
  end

  def moves
    browns + greens + clears
  end
end