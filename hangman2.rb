require 'colorize'

class Hangman

  def initialize
    @head        =  " ".colorize(:white)
    @body        =  " ".colorize(:yellow)
    @left_arm    =  " ".colorize(:green)
    @right_arm   =  " ".colorize(:red)
    @left_leg    =  " ".colorize(:magenta)
    @right_leg   =  "  ".colorize(:light_blue)
    @chances     =  7
    @secret_word =  words[rand(words.length)].chomp
    @solution    =  Array.new(mystery_word.length, "_")
    @words       =
    @prompt      =  "❖"
    @guessed     =  []
    [
      marshmellow, ocean, umbrella, sunscreen, sunglasses,
      fish, shark, lifeguard, swimsuit, sand, volleyball
    ]
  end

  def board
    puts "|     _________"
    puts "|     |/      |"
    puts "|     |      #{@head}"
    puts "|     |  #{@left_arm}#{@body}#{@right_arm}"
    puts "|     |      #{@body}"
    puts "|     |  #{@left_leg}#{@right_leg}"
    puts "|     |      "
    puts "| ____|___   "
  end

  def progression
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
    end

  def run
    puts board
    while @chances > 0
      puts "You have #{@chances} left."
      puts "Letters Guessed: #{guessed}"
      puts @solution
      print "Please guess a letter: " + @prompt
      guess = gets.downcase.chomp.strip

      if guess == @secret_word.to_s
        puts "You are safe!"
        exit
      end

      if @guessed.include(guess)
        puts "You have already guessed that letter. Please try again."
        next
      elsif @secret_word.include?(guess)
        puts "Correct!"
        @secret_word.each_index do |x|
          if @secret_word[x] == guess
            @solution[x] = guess
          end
        end
      else
        puts "Sorry, that's incorrect."
        @chances -= 1
      end
    end
  end
  guessed << guess
  end
run
end
