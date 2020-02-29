class Codebreaker

  include MastermindUtils

  def initialize()
    @hints = []
    @guesses = []
  end

  def make_a_guess()
    guess = create_guess
    @guesses.append(guess)
    return guess
  end

  def store_hint(hint)
    @hints.append(hint)
  end

  def print_hints()
    puts " Guesses     |  Hints"
    puts "-------------------------------"
    for i in 0...@guesses.length do
      @guesses[i].printit
      print " | "
      @hints[i].printit
      puts
      puts
      puts "Now enter your next guess."
    end

  end
end
