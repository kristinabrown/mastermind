require_relative 'mastermind'
require_relative 'printer'

printer = Printer.new

printer.greeting

exit_game = false

until exit_game == true

  main_menu = false
  printer.main_menu
  input = gets.chomp

  until main_menu == true


    if input == 'p' || 'play'
      printer.play_intro
      mastermind = Mastermind.new
      mastermind.secret_code

        response = nil

        until response && response.status == :won
          print "> "
          input = gets.chomp
          response = mastermind.input_parser(input)
          puts response.message
        end
        printer.goodbye
        response.status
        main_menu = true
        exit_game = true


    elsif input == 'i' || 'instructions'
      printer.instructions
      main_menu = true

    elsif input == 'q' || 'quit'
      printer.goodbye
      main_menu = true
      exit_game = true

    else
      printer.error_message
      main_menu = true

    end
  end
end
