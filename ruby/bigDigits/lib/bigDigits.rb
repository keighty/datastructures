require_relative 'digit_fixtures'

class BigDigits
  @@digits = [ZERO, ONE]
  def show(number)
    digit_array = number.to_s.split("")
    line_array = Array.new(16) { "" }
    digit_array.each do |digit|
      big_digit = @@digits[digit.to_i]
      big_digit.split("\n").each_with_index do |line, index|
        line_array[index] += line
      end
    end

    line_array.join("\n") + "\n"
  end

  def show_map(number)
    digit_array = number.to_s.split("")
    line_array = Array.new(16) { "" }

    digit_array.each do |digit|
      big_digit = @@digits[digit.to_i].split("\n").reverse!
      line_array = line_array.map do |e|
        e += big_digit.pop
      end
    end
    line_array.join("\n") + "\n"
  end
end
