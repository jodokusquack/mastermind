#!/usr/bin/env ruby

require_relative "string_formatting.rb"
require_relative "codemaker.rb"
require_relative "codebreaker.rb"
require_relative "pin.rb"
require_relative "game.rb"

game = Game.new()
new_round = true
while new_round do
  game.play_a_round()
  new_round = game.new_round?
end
puts "Thanks for playing!".green


test_guess = [
  Pin.new("b"),
  Pin.new("c"),
  Pin.new("b"),
  Pin.new("b"),
]

