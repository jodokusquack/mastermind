class HumanCodebreaker

  include MastermindUtils

  def initialize()

  end

  def make_a_guess()
    return create_human_guess
  end

  private

  def create_human_guess()
    # begin input validation
    begin
      input = gets.chomp.downcase
      color_validate(input)
    rescue InputLengthError, WrongColorError => e
      puts e.message.red
      retry
    end

    # if input validation didn't
    # fail, now create the guess from
    # the input
    guess = [
      Pin.new(input[0]),
      Pin.new(input[1]),
      Pin.new(input[2]),
      Pin.new(input[3]),
    ]
    return guess
  end
end
