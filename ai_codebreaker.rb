class AICodebreaker < Codebreaker

  def make_a_guess()
    puts "Press Enter to see the AI's next guess."
    gets

    super
  end

  private


  def create_guess()
    guess = Sequence.new(
      POSSIBLE_COLORS.sample,
      POSSIBLE_COLORS.sample,
      POSSIBLE_COLORS.sample,
      POSSIBLE_COLORS.sample,
    )
    return guess
  end
end
