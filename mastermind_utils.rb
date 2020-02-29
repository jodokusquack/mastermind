module MastermindUtils
  POSSIBLE_COLORS = ["b", "r", "m", "y", "g", "c"]

  CODE_LENGTH = 2

  ANSWERS = {
    one: "Congratulations Codebreaker! You broke the code.\nAre you a super spy?".green,
    two: "Oh no! The Codemaker won. Better Luck Next time.".red,
    three: "Good job Codemaker! The AI couldn't break your code.".green,
    four: "Oh no, the AI broke your code. You should choose a harder one next time.".red,
    five: "Congratulations, the Codebreaker won!".green,
    six: "Good job Codemaker! You won.".green
  }

  TEXT_WIDTH = 35

  def color_validate(input)
    # allow the user to start a new
    # game
    if input[0..2].downcase == "new"
      raise NewGameError
    end

    # check if input is of
    # correct length
    if input.length != CODE_LENGTH
      raise InputLengthError, CODE_LENGTH
    end

    # check for only possible colors
    # are used
    wrong_colors = input.split("") - POSSIBLE_COLORS 
    if wrong_colors != []
      raise WrongColorError, wrong_colors
    end
  end
end
