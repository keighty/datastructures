require_relative './three_n_plus_one'

class ThreeNPlusOneMax
  attr_accessor :max, :input_range, :output

  def initialize
    @output = []
  end

  def process(*args)
    if args.empty?
      process_input
    else
      process_string(args[0][:input])
    end
    output_string
  end

  def output_string
    output.each do |tuple|
       puts tuple.join(" ")
    end
  end

  private
    def process_input
      process_string(ARGF.read)
    end

    def process_string(string)
      string.split("\n").each do |tuple|
        process_tuple(tuple)
      end
    end

    def process_tuple(pair_string)
      @input_range = pair_string.split(" ").map(&:to_i)
      output << process_range(input_range[0]..input_range[1])
    end

    def process_range(range)
      @max = 0
      range.each do |number|
        sequence(number)
      end
      [input_range[0], input_range[1], max]
    end

    def sequence(number)
      tnp1 = ThreeNPlusOne.new(number)
      temp = tnp1.sequence_number
      @max = temp if temp > @max
    end
end