#!/usr/bin/env ruby

require 'colorize'
require_relative 'game_play'
require_relative 'printer'
require_relative 'parser'



class Runner

  def initialize
    @exit_game = false
    @exit_menu = false
  end

  def main_menu_options(input)
    case
    when play?(input)
      Printer.play_intro
      game = GamePlay.new
      secret = game.secret_code
      game.game_loop(secret)

    when instructions?(input)
      Printer.instructions
      main_menu_options(input)

    when quit?(input)
      Printer.goodbye
      @exit_game = true

    else
      Printer.error_message
      main_menu_options(input)
    end
  end

  def winner_menu
    Printer.menu_after_win
    input = gets.chomp
    main_menu_options(input)
  end

  def play?(input)
    input == "p" || input == "play"
  end

  def instructions?(input)
    input == "i" || input == "instructions"
  end

  def quit?(input)
    input == 'q' || input == 'quit'
  end

end


Printer.greeting


until @exit_game == true

  Printer.main_menu
  input = gets.chomp
  runner = Runner.new
  runner.main_menu_options(input)

end
