require_relative 'digit_fixtures'

class BigDigits
  @@digits = [ZERO, ONE]
  def show(number)

    #split the number into char array
    digit_array = number.to_s.split("")

    line_array = Array.new(16) { "" }

    #for each digit, split it on \n and add to line_array
    digit_array.each do |digit|
      big_digit = @@digits[digit.to_i]
      big_digit.split("\n").each_with_index do |line, index|
        line_array[index] += line
      end
    end

    line_array.join("\n") + "\n"
  end
end
