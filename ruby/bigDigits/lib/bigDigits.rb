require_relative 'digit_fixtures'

class BigDigits
  attr_accessor :line_array, :digits

  def initialize
    @line_array = Array.new(16) { "" }
    @digits = [ZERO, ONE]
  end

  def show(number)
    process_number(number.to_s)
  end

  def process_number(number_string)
    number_string.each_char do |digit|
      process_digit(get_big_digit(digit))
    end
    process_line_array
  end

  def get_big_digit(digit)
    digits[digit.to_i]
  end

  def process_digit(big_digit)
    big_digit.split("\n").each_with_index do |line, index|
      process_line(line, index)
    end
  end

  def process_line(line, index)
    line_array[index] += line
  end

  def process_line_array
    line_array.join("\n") + "\n"
  end
end
