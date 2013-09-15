require 'fixtures'

class MadLibs
  attr_accessor :game, :words

  def initialize
    @game = GAMES[rand(GAMES.length)]
  end

  def play
    make_story
  end

  private

    def word_array
      game.word_list
    end

    def phrase
      game.phrase
    end

    def get_madlibs
      @words = word_array.map do |word|
        get_word(word)
      end
    end

    def get_word(type="adjective")
      message = "Give me "
      message += type =~ /\A[aeiou]/i ? "an " : "a "

      puts message + type

      gets.chomp
    end

    def make_story
      get_madlibs.length.times do
        replace_numbers
      end
      puts phrase
    end

    def replace_numbers
      number = phrase.match(/(\d)/)[0]
      phrase.gsub!(number, words[number.to_i])
    end
end