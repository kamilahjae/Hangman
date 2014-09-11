load "colorize"
require "colorize"

class Hangman
  def initialize
    @head = "0"
    @body = ""
    @left_arm = ""
    @right_arm = ""
  end
  def board
    "-------|\n   #[@head]   |\n  #[@left_arm]#[@body]#[@right_arm]  |\n  #[@left_leg]#[@right_leg]  |\n ------\n"
  end

end
# Draw and print the board
# secret word
# take a guess and compare to secret word
# remember guesses
# it should know if a guess has already been guessed
# It should know when game is complete or hanged
# remember which parts have been added
# body parts need color


h = Hangman.new
puts h.board
