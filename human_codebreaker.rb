class HumanCodebreaker < Codebreaker

  private

  def create_guess()
    # begin input validation
    begin
      input = gets.chomp.downcase
      if input == "hints"
        print_hints
        input = gets.chomp.downcase
      end
      color_validate(input)
    rescue InputLengthError, WrongColorError => e
      puts e.message.red
      retry
    end

    # if input validation didn't
    # fail, now create the guess from
    # the input
    guess = Sequence.new(input.split(""))
    return guess
  end
end
