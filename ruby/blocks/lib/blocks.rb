class Blocks
  attr_accessor :piles, :locations

  def initialize(size)
    @locations = Array.new(size) { |index| index }
    @piles     = Array.new(size) { |index| [index] }
  end

  def show_piles
    message = ""
    @piles.each_with_index do |element, index|
      message += "#{index}: #{element.join(" ")}\n"
    end
    message
  end

  def arm(args)
    command  = "#{args[0]}_#{args[2]}"
    a        = args[1].to_i
    b        = args[3].to_i

    self.send(command.to_sym, a, b)
  end

  # puts block a onto block b after returning any blocks that are stacked on top of blocks a and b to their initial positions.
  def move_onto(a, b)
    reveal(a)
    reveal(b)
    piles[locations[b]] << piles[locations[a]].pop
    locations[a] = locations[b]
  end

  # puts block a onto the top of the stack containing block b, after returning any blocks that are stacked on top of block a to their initial positions.
  def move_over(a, b)
    reveal(a)
    piles[locations[b]] << piles[locations[a]].pop
    locations[a] = locations[b]
  end

  def pile(a, operator, b)
  end

  def quit
  end

  private
    def reveal(block)
      loc = locations[block]
      top_block = piles[loc].last
      while top_block != block
        top_block = piles[loc].pop
        piles[top_block] << top_block
        top_block = piles[loc].last
      end
    end

end
