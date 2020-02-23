class String
  def red()
    return "\e[31m#{self}\e[0m"
  end

  def green()
    return "\e[32m#{self}\e[0m"
  end
end
