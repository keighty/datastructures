require 'fixtures'

class MadLibs
  attr_accessor :game, :words

  def initialize
    @game = GAMES[rand(GAMES.length)]
  end

  def play
    make_story
    show_story
  end

  private
    def make_story
      get_madlibs
      insert_words
    end

    def show_story
      puts phrase
    end

    def get_madlibs
      @words = word_array.map do |word|
        get_word(word)
      end
    end

    def insert_words
      word_array.length.times do
        number = phrase.match(/(\d)/)[0]
        phrase.gsub!(number, words[number.to_i])
      end
    end

    def get_word(type="adjective")
      message = "Give me "
      message += type =~ /\A[aeiou]/i ? "an " : "a "

      puts message + type

      gets.chomp
    end

    def word_array
      game.word_list
    end

    def phrase
      game.phrase
    end
end