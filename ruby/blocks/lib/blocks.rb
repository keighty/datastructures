class Blocks
  attr_accessor :piles, :locations

  def process_input
    process_string(ARGF.read)
  end

  def start(size)
    @locations = Array.new(size) { |index| index   }
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

    return if a == b || locations[a] == locations[b]

    self.send(command.to_sym, a, b)
  end

  # puts block a onto block b after returning any blocks that are stacked on top of blocks a and b to their initial positions.
  def move_onto(a, b)
    reveal(a)
    reveal(b)
    move_single(a, b)
  end

  # puts block a onto the top of the stack containing block b, after returning any blocks that are stacked on top of block a to their initial positions.
  def move_over(a, b)
    reveal(a)
    move_single(a, b)
  end

  # moves the pile of blocks consisting of block a, and any blocks that are stacked above block a, onto block b. All blocks on top of block b are moved to their initial positions prior to the pile taking place. The blocks stacked above block a retain their order when moved.
  def pile_onto(a, b)
    reveal(b)
    move_array(a, b)
  end

  # puts the pile of blocks consisting of block a, and any blocks that are stacked above block a, onto the top of the stack containing block b. The blocks stacked above block a retain their original order when moved.
  def pile_over(a, b)
    move_array(a, b)
  end

  def quit_(*args)
    show_piles
    abort
  end

  private
    def process_string(string)
      commands = string.split("\n")
      start(commands.shift.to_i)
      until commands.empty?
        arm(commands.shift.split(" "))
      end
      puts show_piles
    end

    def reveal(block)
      loc = locations[block]
      while((top_block = piles[loc].last) != block)
        top_block = piles[loc].pop
        piles[top_block] << top_block
      end
    end

    def move_single(a, b)
      piles[locations[b]] << piles[locations[a]].pop
      locations[a] = locations[b]
    end

    def move_array(a, b)
      #split the array at the pile location of a on a
      a_location = piles[locations[a]]
      a_partial = a_location.slice(a_location.index(a)..-1)

      a_partial.each do |block|
        piles[locations[b]] << block
        piles[locations[block]].pop
        locations[block] = locations[b]
      end
    end
end
