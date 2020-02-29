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
end
