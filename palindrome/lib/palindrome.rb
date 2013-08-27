class Palindrome
  attr_accessor :string

  def initialize(string)
    @string = string.downcase
  end

  def palindrome?
    reverse_string = Array.new
    orig_string = string.split('')

    orig_string.size.times do |n|
      reverse_string << orig_string.pop
    end
    string == reverse_string.join('')
  end
end
