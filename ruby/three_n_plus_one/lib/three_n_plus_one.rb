class ThreeNPlusOne
  attr_reader :sequence

  def initialize(number)
    @sequence = []
    make_sequence(number)
  end

  def sequence_number
    sequence.length
  end

  private
    def make_sequence(number)
      sequence.push(number)

      return if number == 1

      if number % 2 == 0
        make_sequence(number/2)
      else
        make_sequence(number * 3 + 1)
      end
    end
end
