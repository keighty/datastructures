class Fizzbuzz
  def check_mod(number)
    message = ""
    message += "fizz" if number % 3 == 0
    message += "buzz" if number % 5 == 0
    message += number.to_s if message == ""
    return message
  end
end
