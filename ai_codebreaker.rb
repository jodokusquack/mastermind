class AICodebreaker < Codebreaker

  def make_a_guess()
    puts "Press Enter to see the AI's next guess."
    gets

    super
  end

  private


  def create_guess()
    guess =[
      Pin.new(POSSIBLE_COLORS.sample),
      Pin.new(POSSIBLE_COLORS.sample),
      Pin.new(POSSIBLE_COLORS.sample),
      Pin.new(POSSIBLE_COLORS.sample),
    ]
    return guess
  end
end
