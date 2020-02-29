class Codemaker

  include MastermindUtils

  # for debugging:
  #attr_reader :code

  def initialize(consciousness)
    # humans have consciousness and
    # AI doesn't. Yet...
    @consciousness = consciousness
  end

  def create_code(debug=false)
  # create_code() creates the secret
  # Colorcode for the Codemaker.
    puts "-----------------------------------"
    if debug
      @code = create_debug_code
      return
    end
    if @consciousness == true
      puts "\e[4mCodemaker\e[0m:"
      puts "Please enter the secret code. Make it as hard as you can! Don't worry your code won't show on screen.".break_up(TEXT_WIDTH)

      @code = create_human_code
    elsif @consciousness == false
      @code = create_AI_code
    end
  end

  def correct_guess?(guess)
  # this methods checks wheter a
  # guess is correct and returns true
  # or false and the hint for any
  # guess
    hint = compare(guess)
    correct_hint = Sequence.new(
      "gr",
      "gr",
      "gr",
      "gr",
    )

    if hint == correct_hint
      return true, hint
    else
      return false, hint
    end
  end

  private

  def compare(guess)
    # initialize empty variables
    guess_new = []
    code_new = []
    hint = []

    # first, compare all pins in the
    # guess in order with the code and
    # if they are  not equal add them
    # to a new array.
    guess.each_with_index do |pin, index|
      if pin != @code[index]
        guess_new.append(guess[index])
        code_new.append(@code[index])
      elsif pin == @code[index]
        hint.append("gr")
      end
    end

    # second, check for all remaining
    # pins in the guess if they are
    # contained SOMEWHERE in the
    # secret code and then delete this
    # pin from the code_copy
    guess_new.each do |pin|
      if code_new.include?(pin)
        hint.append("wh")
        code_new.delete_at(code_new.index(pin))
      end
    end

    return Sequence.new(*hint)
  end

  def create_human_code()
    # begin input validation
    begin
      # don't show the input on the
      # screen
      input = STDIN.noecho(&:gets).chomp.downcase

      color_validate(input)
    rescue InputLengthError, WrongColorError => e
      puts e.message.red
      retry
    end

    code  = Sequence.new(
      input[0],
      input[1],
      input[2],
      input[3],
    )
    return code
  end

  def create_AI_code()
    # the AI creates a random code
    code = Sequence.new(
      POSSIBLE_COLORS.sample,
      POSSIBLE_COLORS.sample,
      POSSIBLE_COLORS.sample,
      POSSIBLE_COLORS.sample,
    )
    return code
  end

  def create_debug_code()
    code = Sequence.new(
      "b",
      "c",
      "b",
      "y",
    )

    code.printit("Code")
    return code
  end
end
