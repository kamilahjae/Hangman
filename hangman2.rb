require 'colorize'

class Hangman

  def initialize
    @head        =  " ".colorize(:white)
    @body        =  " ".colorize(:yellow)
    @left_arm    =  " ".colorize(:green)
    @left_arm    =  "  ".colorize(:green)
    @right_arm   =  " ".colorize(:red)
    @left_leg    =  " ".colorize(:magenta)
    @right_leg   =  "  ".colorize(:light_blue)
    @chances     =  8
    @prompt      =  "❖ "
    @guessed     =  []
    @words       =  [
      "marshmellow", "ocean", "umbrella", "sunscreen", "sunglasses",
      "fish", "shark", "lifeguard", "swimsuit", "sand", "volleyball"
    ]
    @secret_word =  @words.sample
    @solution    =  Array.new(@secret_word.length, "_")

  end

  def board
    puts "|     _________"
    puts "|     |/      |"
    puts "|     |    #{@head}"
    puts "|     |    #{@left_arm}#{@body}#{@right_arm}"
    puts "|     |      #{@body}"
    puts "|     |    #{@left_leg} #{@right_leg}"
    puts "|     |      "
    puts "| ____|___   "
  end

  def progression
    if @chances > 6
      puts "You are off to a great start!"
    elsif @chances == 6
      @head << "(O O)"
    elsif @chances == 5
      @body << "|"
    elsif @chances == 4
      @left_arm = " /"
    elsif @chances == 3
     @right_arm << "\\"
    elsif @chances == 2
     @left_leg << "/"
    elsif @chances == 1
     @right_leg << "\\"
   elsif @chances == 0
     @head = "(X X)"
    end
  end

  def check_answer
    if @solution.join == @secret_word
      puts "You are safe!"
      exit
    end
  end

  def run
    while @chances > 0
      joined_letters_from_solution_array = @solution.join

      puts board

      puts "You have #{@chances} left."
      puts "Letters Guessed: #{@guessed}"
      puts joined_letters_from_solution_array
      print "Please guess a letter: " + @prompt
      guess = gets.chomp.downcase.strip

      if joined_letters_from_solution_array == @secret_word
        puts "You are safe!"
        break
      end

      if @guessed.include?(guess)
        puts "You have already guessed that letter. Please try again."
        next
      elsif @secret_word.include?(guess)
        puts "Correct!"
        split_word = @secret_word.chars
        split_word.each_index do |x|
          if @secret_word[x] == guess
            @solution[x] = guess
          end
        end
        check_answer
      elsif @chances == 1 # This case is for last incorrect guess; end of game
        progression
        puts "You're hanged!"
        puts board
        exit
      else
        puts "Sorry, that's incorrect."
        @chances -= 1
      progression
      end
      @guessed << guess
    end
  end
end


h = Hangman.new
h.run
