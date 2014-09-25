require 'colorize'
class Hangman

  def initialize
    @head       =  " ".colorize(:white)
    @body       =  " ".colorize(:yellow)
    @left_arm   =  " ".colorize(:green)
    @right_arm  =  " ".colorize(:red)
    @left_leg   =  " ".colorize(:magenta)
    @right_leg  =  "  ".colorize(:light_blue)
    @secret     =  random_word
    @characters =  empty_characters
    @guesses    =  []
    @chances    =  7
    @words      =  []
    @game_over  =  false
  end

  def empty_characters
    Array.new(@secret.length, "_") # creates an array and assigns "_" for the length of word
  end

  def characters
    @characters
  end

  def make_guess(guessed_letter)
    return false if @guesses.include?(guessed_letter)
    @secret.chars.each_with_index do |letter, index|
      if guessed_letter == letter
        @characters[index] = letter
      else
        @chances -= 1
      end
    end
    @guesses << guessed_letter
  end

  def guess
    @characters.join # take everything in array and join it together
  end

  def chances
    if @chances == 7
      puts "You are off to a great start!"
    elsif @chances == 6
      puts @head << "(X X)"
    elsif @chances == 5
      puts @body << "|"
    elsif @chances == 4
      puts @left_arm << "/"
    elsif @chances == 3
      puts @right_arm << "\\"
    elsif @chances == 2
      puts @left_leg << "/"
    elsif @chances == 1
      puts @right_leg << "\\"
    else
      puts "Sorry, you lost!"
    end
  end

  def show

  end

  def board
    puts @chances
    "-------|\n   #{@head}   |\n  #{@left_arm}#{@body}#{@right_arm}  |\n  #{@left_leg}#{@right_leg}  |\n_______|\n"
  end
  def words
    ["asteroid", "martians"]
  end

  def random_word
    words.sample
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
# remove a body part for wrong guess

def game_over
  @chances == 0
end

def run
  while(! game_over)
    h = Hangman.new
    puts h.board
    puts h.guess
    puts "What letter would you like to guess?"
    guess = gets.chomp
    h.make_guess(guess)
  end
end

run
