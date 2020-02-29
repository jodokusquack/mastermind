class Sequence

  include Enumerable

  attr_reader :sequence

  def initialize(*sequence)
    @sequence = []
    sequence.each do |color|
      @sequence.append(Pin.new(color))
    end
  end

  def ==(other)
    if self.class == other.class
      return @sequence == other.sequence
    else
      return false
    end
  end
  
  def each(&block)
    for item in @sequence do
      block.call(item)
    end
  end

  def [](key)
    return @sequence[key]
  end

  def printit(label="")
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
