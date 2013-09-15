require 'madlib_game'

GAMES = [
  MadLibGame.new(
    word_list: ["adjective", "body part", "noun"],
    phrase: "I had a 0 sandwich for lunch today. It dripped all over my 1 and 2."),
  MadLibGame.new(
    word_list: ["adjective", "adjective", "noun", "adjective", "adjective", "noun", "adjective", "verb", "verb"],
    phrase: "A 0, 1 source 2 language with a focus on 3 and 4 It has an elegant 5 that is 6 to 7 and easy to 8."),
  MadLibGame.new(
    word_list: ["noun", "adjective", "verb", "plural noun", "adjective", "noun", "plural noun", "plural noun", "plural noun"],
    phrase: "A 0 is a 1 way to 2 a number of 3 together, using 4 methods, without having to write an explicit 5. The 0 5 is a generator of specific 6, each one of which is defined to hold a set of 7 and their 8.")
]