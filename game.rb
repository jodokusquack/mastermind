class Game

  include MastermindUtils

  def initialize()
    @codemaker_score = 0
    @codebreaker_score = 0
  end

  def setup()
    puts("Welcome to Mastermind! Check out my Github for a small explanation of the rules or just start playing. 

How do you want to play?")
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
        @codebreaker = Codebreaker.new(true)
      elsif input == 2 
        @codemaker = Codemaker.new(true)
        @codebreaker = Codebreaker.new(false)
      elsif input == 3
        @codemaker = Codemaker.new(true)
        @codebreaker = Codebreaker.new(true)
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
    guesses = 0
    @codemaker.create_code()
    correct_guess = false
    while (guesses < 10 and correct_guess == false) do
      puts "-----------------------------------"
      guess = @codebreaker.make_a_guess()

      correct_guess, hint = @codemaker.correct_guess?(guess)
      guesses += 1
      printit("Guess ##{guesses.to_s}", guess)
      printit("Hint", hint)
      puts "-----------------------------------"
    end

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
    puts "Do you want to play another round? [Y/n]"
    answer = gets.chomp.downcase
    if ["n", "q", "e"].include?(answer[0])
      return false
    else
      return true
    end
  end

  private

  def printit(label, code)
    puts "#{label}:"
    code.each do |pin|
      print pin.to_s
    end
    puts
  end

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
