class WrongColorError < StandardError
  MSG = "Please only use the following colors:
      * Blue: 'b'
      * Red: 'r'
      * Magenta: 'm'
      * Yellow: 'y'
      * Grey: 'g'
      * Cyan: 'c'"

  attr_reader :wrong_colors

  def initialize(wrong_colors)
    @wrong_colors = wrong_colors
    msg = "The following colors weren't recognised: #{@wrong_colors}\n" + MSG
    super(msg)
  end
end

class InputLengthError < StandardError
  MSG = "Please use exactly four colors."

  def initialize(msg=MSG)
    super
  end
end

class InputError < StandardError
end

class NewGameError < StandardError

end
