class String
  def red()
    # make text red
    return "\e[31m#{self}\e[0m"
  end

  def green()
    # make text green
    return "\e[32m#{self}\e[0m"
  end

  def break_up(width)
    # this method takes a string and
    # breaks it up in substrings with
    # a max length of 'width' and only
    # splitting on ' '. 
    string = self
    parts = []
    while string.is_a?(String) and string.length > width
      index = width
      # first check backwards from the
      # position to find the next ' '
      while string[index] != " "
        index -= 1
        break if index == 0
      end

      # if no ' ' is found look
      # forward
      if index == 0
        index = width 
        while string[index] != " "
          index += 1
          break if index > string.length
        end
      end

      # save the substring and
      # substract it for the next
      # line.
      parts.append(string[0...index])
      string = string[index+1..-1]
    end
    parts.append(string)
    return parts.join("\n")
  end
end
