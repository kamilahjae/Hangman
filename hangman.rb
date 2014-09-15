
class Hangman

  def initialize
    @head       =  " "
    @body       =  " "
    @left_arm   =  " "
    @right_arm  =  " "
    @left_leg   =  " "
    @right_leg  =  " "
    @secret     = random_word
    @characters = empty_characters
  end

  def empty_characters
    Array.new(@secret.length, "_") # creates an array and assigns "_" for the length of word
  end

  def characters
    @characters
  end

  def make_gess(guessed_letter)
    @secret.chars.each_with_index do |letter, index|
      if guessed_letter == letter
        @characters[index] = letter
      end
    end
  end

  def guess
    @characters.join # take everything in array and join it together
  end

  def board
    "-------|\n   #{@head}   |\n  #{@left_arm}#{@body}#{@right_arm}  |\n  #{@left_leg}#{@right_leg}   |\n------\n"
  end

  def random_word
    words.sample
  end

  def words
    ["blah", "foo"]
  end

end
# Draw and print the board
# secret word
# make the concept of blank spaces
# take a guess and compare to secret word, update the characters with
  # the guessed letter
# remember guesses
# it should know if a guess has already been guessed
# It should know when game is complete or hanged
# remember which parts have been added
# body parts need color


h = Hangman.new
puts h.board
puts h.guess
h.guess
h.make_guess("l")
