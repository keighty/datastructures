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

  def profit?(starting_value=1.0)
    conversions.each do |conversion|
      end_value = starting_value
      conversion.each do |convert|
        end_value *= convert
      end
      if end_value > starting_value*1.1
        p conversion
      end
    end
  end
end