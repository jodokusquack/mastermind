class Codemaker

  POSSIBLE_COLORS = ["b", "r", "m", "y", "g", "c"]
  #attr_reader :code

  def initialize

  end

  # create_code() creates the secret
  # Colorcode for the Codemaker.
  # The style can be "random", "choose" or
  # "debug". 
  def create_code(style="random")
    if style == "random"
      @code = [
        Pin.new(POSSIBLE_COLORS.sample),
        Pin.new(POSSIBLE_COLORS.sample),
        Pin.new(POSSIBLE_COLORS.sample),
        Pin.new(POSSIBLE_COLORS.sample),
      ]
    elsif style == "debug"
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

    # puts "Interrupt:"
    # arr = [guess, @code, guess_new, code_new]
    # arr.each do |var|
    #   var.each do |pin|
    #     print pin
    #   end
    #   puts
    # end
    # puts "Interrupt Ended"

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

  def printit(code)
    code.each do |pin|
      print pin.to_s
    end
    puts
  end
end
