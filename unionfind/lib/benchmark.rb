require 'benchmark'
require_relative './quickfind'
require_relative './quickunion'
require_relative './weightedquickunion'

@size = 10000


def testUnit(object)
  @size.times do
    object.union(rand(@size), rand(@size))
    object.find(rand(@size), rand(@size))
  end
end

Benchmark.bm do |x|
  x.report { testUnit(QuickFind.new(@size)) }
  x.report { testUnit(QuickFind.new(@size)) }
  x.report { testUnit(QuickFind.new(@size)) }
  # x.report { testUnit(QuickUnion.new(@size)) }
  # x.report { testUnit(WeightedQuickUnion.new(@size)) }
end