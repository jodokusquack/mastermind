class Codebreaker

  include MastermindUtils

  def initialize(consciousness)
    @consciousness = consciousness
  end

  def make_a_guess()
    if @consciousness == true
      puts("Make a guess by typing four letters for your colorcode.")

      begin
        input = gets.chomp.downcase

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

      guess = [
        Pin.new(input[0]),
        Pin.new(input[1]),
        Pin.new(input[2]),
        Pin.new(input[3]),
      ]

    elsif @consciousness == false

      guess =[
        Pin.new(POSSIBLE_COLORS.sample),
        Pin.new(POSSIBLE_COLORS.sample),
        Pin.new(POSSIBLE_COLORS.sample),
        Pin.new(POSSIBLE_COLORS.sample),
      ]
    end

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
