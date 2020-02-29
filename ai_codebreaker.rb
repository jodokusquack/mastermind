class AICodebreaker < Codebreaker

  def make_a_guess()
    puts "Press Enter to see the AI's next guess."
    gets

    super
  end

  private


  def create_guess()
    template = []
    CODE_LENGTH.times do
      template.append(POSSIBLE_COLORS.sample)
    end
    guess = Sequence.new(template)

    return guess
  end
end
