class Codebreaker

  include MastermindUtils

  def initialize(consciousness)
    # Conciousness is true for humans
    @consciousness = consciousness
  end

  def make_a_guess()
    if @consciousness == true
      guess = create_human_guess

    elsif @consciousness == false
      puts "Press Enter to see the AI's next guess."
      gets

      guess = create_AI_guess
    end

    return guess
  end

  private

  def create_human_guess()
    # begin input validation
    begin
      input = gets.chomp.downcase

      # allow the user to quit
      if input[0].downcase == "q"
        abort("You quit the game!".red)
      end

      # check if input is in the
      # correct form.
      if input.length != 4
        raise InputLengthError
      end
      wrong_colors = input.split("") - ["b", "r", "m", "y", "g", "c"]
      if wrong_colors != []
        raise WrongColorError, wrong_colors
      end

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
