class Game

  include MastermindUtils

  def initialize()
    @codemaker_score = 0
    @codebreaker_score = 0
  end

  def setup()
    # this asks the player as what
    # role he wants to play and
    # creates the codemaker/breaker
    # accordingly.
    puts "Welcome to Mastermind! Check out my Github for a small explanation of the rules or just start playing.".break_up(TEXT_WIDTH)
   puts "How do you want to play?"
    puts
    print "       "
    print "\e[4mCodemaker\e[0m"
    print ":"
    print "\e[4mCodebreaker\e[0m"
    puts
    puts "  [1]      AI  vs. Human    "
    puts "  [2]    Human vs.   AI     "
    puts "  [3]    Human vs. Human    "

    begin
      input = gets.chomp.to_i
      if input == 1
        @codemaker = Codemaker.new(false)
        @codebreaker = HumanCodebreaker.new()
      elsif input == 2 
        @codemaker = Codemaker.new(true)
        @codebreaker = AICodebreaker.new()
      elsif input == 3
        @codemaker = Codemaker.new(true)
        @codebreaker = HumanCodebreaker.new()
      else 
        raise InputError, "Please choose a valid option from above"
      end

    rescue InputError => e
      puts e.message.red
      retry
    rescue Interrupt
      puts "Thanks for playing".green
      exit
    end

  end

  def play_a_round()
    # this method plays a whole round
    # until either the maker or
    # breaker has won the game.
    guesses = 0
    @codemaker.create_code(debug=true)
    correct_guess = false

    # instruct the Codebreaker that
    # it's his/her turn.
    puts "\e[4mCodebreaker\e[0m:"
    puts "Make a guess by typing four letters for your colorcode.".break_up(TEXT_WIDTH)

    while (guesses < 10 and correct_guess == false) do
      puts "-----------------------------------"
      guess = @codebreaker.make_a_guess()

      correct_guess, hint = @codemaker.correct_guess?(guess)
      @codebreaker.store_hint(hint)
      guesses += 1
      guess.printit("Guess ##{guesses.to_s}")
      hint.printit("Hint")
      puts "-----------------------------------"
    end

    # update the scores
    if correct_guess
      @codebreaker_score += 1
      puts ANSWERS[:one]
    else
      @codemaker_score += 1
      puts ANSWERS[:two]
    end

    printscore()
  end

  def new_round?()
    # asks the player for another
    # round
    puts "Do you want to play another round? [Y/n]".break_up(TEXT_WIDTH)
    answer = gets.chomp.downcase
    if ["n", "q", "e"].include?(answer[0])
      return false
    else
      return true
    end
  end

  private

  def printscore()
    puts
    print "             "
    print "\e[4mCodemaker\e[0m"
    print ":"
    print "\e[4mCodebreaker\e[0m"
    puts
    print "The score is:"
    print @codemaker_score.to_s.center(9)
    print "|"
    print @codebreaker_score.to_s.center(11)
    puts
  end
end
