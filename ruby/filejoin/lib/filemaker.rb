# generate array of 1000 ids
# generate 1000 random ages and store in the array
# output to a file

class Filemaker

  def initialize(number, filename)
    age_array = Array.new(number) { rand(90) }
    save_array(age_array, filename)
  end

  def save_array(age_array, filename)
    File.open(filename, "w") do |file|
      age_array.each_with_index do |age, index|
        file.puts("#{index}, #{age}")
      end
    end
  end
end
