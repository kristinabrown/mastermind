require_relative 'mastermind'
require_relative 'printer'



Printer.greeting

exit_game = false

until exit_game == true

  main_menu = false
  Printer.main_menu
  input = gets.chomp

  until main_menu == true

    if input == 'p' || input == 'play'
      Printer.play_intro
      mastermind = Mastermind.new
      mastermind.secret_code

          response = nil

          until response && response.status == :won
            print "> "
            input = gets.chomp
            response = mastermind.input_parser(input)
            puts response.message
          end
          Printer.goodbye
          response.status
          main_menu = true
          exit_game = true

    elsif input == 'i' || input == 'instructions'
      Printer.instructions
      main_menu = true

    elsif input == 'q' || input == 'quit'
      Printer.goodbye
      main_menu = true
      exit_game = true

    else
      Printer.error_message
      main_menu = true
    end
  end
end
