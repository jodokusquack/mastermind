class AICodebreaker

  include MastermindUtils

  def make_a_guess()
    puts "Press Enter to see the AI's next guess."
    gets

    return create_AI_guess
  end

  private


  def create_AI_guess()
    guess =[
      Pin.new(POSSIBLE_COLORS.sample),
      Pin.new(POSSIBLE_COLORS.sample),
      Pin.new(POSSIBLE_COLORS.sample),
      Pin.new(POSSIBLE_COLORS.sample),
    ]
    return guess
  end
end
