#!/usr/bin/env ruby

require_relative "codemaker.rb"
require_relative "codebreaker.rb"
#require_relative "string_formatting"
require_relative "pin.rb"

codemaker = Codemaker.new()
codebreaker = Codebreaker.new()

codemaker.create_code("debug")
puts "Code:"
codemaker.code.each do |pin|
  print pin.to_s
end
puts

test_guess = [
  Pin.new("b"),
  Pin.new("c"),
  Pin.new("b"),
  Pin.new("b"),
]
puts "Guess:"
test_guess.each do |pin|
  print pin
end
puts

puts "Hint:"
hint = codemaker.compare(test_guess)
hint.each do |pin|
  print pin
end
