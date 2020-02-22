class Pin
  COLORCODES = {
    "b" => 44,
    "r" => 41,
    "w" => 107,
    "g" => 100,
    "y" => 43,
    "m" => 45,
    "c" => 46,
    "gr" => 42,
    "wh" => 107,
  }

  attr_reader :color

  def initialize(color)
    @color = color
  end
  
  def to_s
    if ["gr", "wh"].include?(@color)
      return "\e[30m\e[#{COLORCODES[@color]}m #{@color.capitalize} \e[0m"
    else
      return "\e[97m\e[#{COLORCODES[@color]}m #{@color.capitalize} \e[0m"
    end
  end

  def ==(other)
    if self.class == other.class
      return @color == other.color
    end
  end
end
