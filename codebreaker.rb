class Codebreaker

  def initialize

  end

  def make_a_guess()
    puts("Make a guess by typing the four letters for your guess.")
    input = gets.chomp
    input = input.downcase

    if input[0].downcase == "q"
      abort("You quit the game!".red)
    end

    # check if input is in the
    # correct form.
    if input.length != 4
      raise ArgumentError, "Please use exactly four colors."
    end
    if input.split("") - ["b", "r", "m", "y", "g", "c"] != []
      raise ArgumentError, "Please only use the following colors:
      * Blue: 'b'
      * Red: 'r'
      * Magenta: 'm'
      * Yellow: 'y'
      * Grey: 'g'
      * Cyan: 'c'"
    end

    guess = [
      Pin.new(input[0]),
      Pin.new(input[1]),
      Pin.new(input[2]),
      Pin.new(input[3]),
    ]

    return guess
  end

  private

  def printit(code)
    code.each do |pin|
      print pin.to_s
    end
    puts
  end
end
