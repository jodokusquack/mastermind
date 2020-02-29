# A sequence represents some number of Pins in an array

class Sequence

  include Enumerable

  attr_reader :sequence

  def initialize(sequence)
    @sequence = []
    sequence.each do |color|
      @sequence.append(Pin.new(color))
    end
  end

  def ==(other)
    # two sequences are equl if all pins are equal
    if self.class == other.class
      return @sequence == other.sequence
    else
      return false
    end
  end
  
  def each(&block)
    # define an each method for the Enumerable module
    for item in @sequence do
      block.call(item)
    end
  end

  def [](key)
    # so you can access pins with the [] syntax
    return @sequence[key]
  end

  def printit(label="")
    # print a sequence by prinitng each pin one after the other
    if label != ""
      puts "#{label}:"
    end
    @sequence.each do |pin|
      print pin.to_s
    end
    if label != ""
      puts
    end
  end
end
