class Game

  ANSWERS = {
    one: "Congratulations Codebreaker! You broke the code.\nAre you a super spy?".green,
    two: "Oh no! The Codemaker won. Better Luck Next time.".red,
    three: "Good job Codemaker! The AI couldn't break your code.".green,
    four: "Oh no, the AI broke your code. You should choose a harder one next time.".red,
    five: "Congratulations, the Codebreaker won!".green,
    six: "Good job Codemaker! You won.".green
  }

  def initialize()
    @codemaker = Codemaker.new()
    @codebreaker = Codebreaker.new()
    @codemaker_score = 0
    @codebreaker_score = 0
  end

  def play_a_round(style="random")
    guesses = 0
    @codemaker.create_code(style)
    correct_guess = false
    while (guesses < 12 and correct_guess == false) do
      puts "-----------------------------------"
      begin
        guess = @codebreaker.make_a_guess()
      rescue ArgumentError => e
        puts e.message.red
        retry
      end
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
