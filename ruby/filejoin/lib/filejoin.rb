class Filejoin
  attr_accessor :age_hash

  def initialize
    @age_hash = Hash.new(0)
  end

  def process_input
    process_string(ARGF.read)
  end

  def sorted_hash
    Hash[*age_hash.sort.flatten]
  end

  def process_string(string)
    string.split("\n").each do |tuple|
      process_tuple(tuple)
    end
  end

  def process_tuple(tuple)
    line = tuple.split(",")
    age_hash[line[1].strip.to_i] += 1
  end

end

f = Filejoin.new
p f.sorted_hash