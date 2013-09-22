class Arbitrage
  attr_accessor :n, :conversions
  def initialize
  end

  def process_input(input=ARGF.read)
    strings = input.split("\n")
    @n = strings.shift.to_i
    get_conversions(strings)
  end

  def get_conversions(strings)
    @conversions = strings.map do |line|
      line.split(" ").map {|x| x.to_f}
    end
  end
end

x = Arbitrage.new
x.process_input
p x.n
p x.conversions