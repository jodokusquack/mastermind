#!/usr/bin/env ruby

require "io/console"

require_relative "string_formatting.rb"
require_relative "mastermind_utils.rb"
require_relative "errors.rb"
require_relative "codemaker.rb"
require_relative "codebreaker.rb"
require_relative "human_codebreaker.rb"
require_relative "ai_codebreaker.rb"
require_relative "pin.rb"
require_relative "sequence.rb"
require_relative "game.rb"

begin
  new_round = true
  while new_round do
    system "clear"
    game = Game.new()
    game.setup()
    game.play_a_round()
    new_round = game.new_round?
  end
  puts "Thanks for playing!".green
rescue Interrupt
  puts "Thanks for playing".green
  exit()
rescue NewGameError
  # catch if the player wants to
  # start a new game and restart in
  # that case
  print "New Game is starting"
  sleep(0.5)
  print(".")
  sleep(0.5)
  print(".")
  sleep(0.5)
  print(".")
  sleep(0.5)
  puts
  retry
end
