#!/usr/bin/env ruby

require "io/console"

require_relative "string_formatting.rb"
require_relative "mastermind_utils.rb"
require_relative "errors.rb"
require_relative "codemaker.rb"
require_relative "human_codebreaker.rb"
require_relative "ai_codebreaker.rb"
require_relative "pin.rb"
require_relative "game.rb"

system "clear"
begin
  game = Game.new()
  game.setup()
  new_round = true
  while new_round do
    game.play_a_round()
    new_round = game.new_round?
  end
  puts "Thanks for playing!".green
rescue Interrupt
  puts "Thanks for playing".green
  exit()
end
