class Codemaker

  include MastermindUtils

  # this was for debugging
  #attr_reader :code

  def initialize(consciousness)
    # humans have consciousness and
    # AI doesn't. Yet...
    @consciousness = consciousness
  end

  def create_code()
  # create_code() creates the secret
  # Colorcode for the Codemaker.
    puts "-----------------------------------"
    if @consciousness == true
      puts "\e[4mCodemaker\e[0m:"
      puts "Please enter the secret code. Make it as hard as you can! Don't worry your code won't show on screen.".break_up(TEXT_WIDTH)

      begin
        # don't show the input on the
        # screen
        input = STDIN.noecho(&:gets).chomp.downcase
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

      @code  = [
        Pin.new(input[0]),
        Pin.new(input[1]),
        Pin.new(input[2]),
        Pin.new(input[3]),
      ]

    elsif @consciousness == false
      # the AI creates a random code
      @code = [
        Pin.new(POSSIBLE_COLORS.sample),
        Pin.new(POSSIBLE_COLORS.sample),
        Pin.new(POSSIBLE_COLORS.sample),
        Pin.new(POSSIBLE_COLORS.sample),
      ]
    elsif @consciousness == "debug"
      @code = [
        Pin.new("b"),
        Pin.new("c"),
        Pin.new("b"),
        Pin.new("y"),
      ]
      puts "Code:"
      printit(@code)
    end
  end

  # this methods checks wheter a
  # guess is correct and returns true
  # or false and the hint for any
  # guess
  def correct_guess?(guess)
    hint = compare(guess)
    correct_hint = [
      Pin.new("gr"),
      Pin.new("gr"),
      Pin.new("gr"),
      Pin.new("gr"),
    ]
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
        hint.append(Pin.new("gr"))
      end
    end

    # second, check for all remaining
    # pins in the guess if they are
    # contained SOMEWHERE in the
    # secret code and then delete this
    # pin from the code_copy
    guess_new.each do |pin|
      if code_new.include?(pin)
        hint.append(Pin.new("wh"))
        code_new.delete_at(code_new.index(pin))
      end
    end

    return hint
  end

end
