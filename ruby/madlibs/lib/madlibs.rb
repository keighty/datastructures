class Madlibs
  MadLibGame = Struct.new(:word_list, :phrase)
  attr_accessor :games, :game

  def initialize
    @games = [
      MadLibGame.new(
        ["adjective", "body part", "noun"],
        "I had a 0 sandwich for lunch today. It dripped all over my 1 and 2."),
      MadLibGame.new(
        ["adjective", "adjective", "noun", "adjective", "adjective", "noun", "adjective", "verb", "verb"],
        "A 0, 1 source 2 language with a focus on 3 and 4 It has an elegant 5 that is 6 to 7 and easy to 8."),
      MadLibGame.new(
        ["noun", "adjective", "verb", "plural noun", "adjective", "noun", "plural noun", "plural noun", "plural noun"],
        "A 0 is a 1 way to 2 a number of 3 together, using 4 methods, without having to write an explicit 5. The 0 5 is a generator of specific 6, each one of which is defined to hold a set of 7 and their 8.")
      ]

    @game = @games[rand(@games.length)]

    show_story(get_madlibs(@game.word_list), @game.phrase)
  end

  def get_madlibs(word_array)
    words = word_array.map do |word|
      get_word(word)
    end
  end

  def get_word(type="adjective")
    if type =~ /\A[aeiou]/i
      puts "Give me an #{type}"
    else
      puts "Give me a #{type}"
    end

    gets.chomp
  end

  def show_story(word_array, phrase)
    word_array.each do |word|
      number = phrase.match(/(\d)/)[0]
      phrase.gsub!(number, word_array[number.to_i])
    end
    puts phrase
  end
end

