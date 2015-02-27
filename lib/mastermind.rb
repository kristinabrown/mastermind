#!/usr/bin/env ruby

require 'colorize'
require_relative 'mastermind_logic'
require_relative 'printer'
require_relative 'parser'



Printer.greeting

@exit_game = false

until @exit_game == true

  @main_menu = false
  Printer.main_menu
  input = gets.chomp

  until @main_menu == true

    #case response.status

    if input == 'p' || input == 'play'
      Printer.play_intro
      mastermind = MastermindLogic.new
      @won = false
      secret = mastermind.secret_code

          response = nil

          until @won == true
            print "> "
            input = gets.chomp
            puts Parser.input_parser(input, secret)
          end
          Printer.goodbye

          @main_menu = true
          @exit_game = true


    elsif input == 'i' || input == 'instructions'
      Printer.instructions
      @main_menu = true

    elsif input == 'q' || input == 'quit'
      Printer.goodbye
      @main_menu = true
      @exit_game = true

    else
      Printer.error_message
      @main_menu = true
    end
  end
end
