class MadLibGame
  attr_accessor :word_list, :phrase

  def initialize(args)
    @word_list = args[:word_list]
    @phrase    = args[:phrase]
  end
end