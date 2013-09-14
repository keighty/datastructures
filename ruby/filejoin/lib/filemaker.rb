# generate array of 1000 ids
# generate 1000 random ages and store in the array
# output to a file

class Filemaker
  attr_accessor :age_array

  def initialize(number)
    @age_array = Array.new(number) { rand(90) }
  end

  def save_file(filename)
    File.open(filename, "w") { |file| write_array(file) }
  end

  def write_array(file)
    age_array.each_with_index do |age, index|
      file.puts("#{index}, #{age}")
    end
  end
end
