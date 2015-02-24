require_relative 'mastermind'
require_relative 'printer'

printer = Printer.new

printer.greeting
input = gets.chomp
exit_game = false

until exit_game == true

  if input == 'p'
    printer.play_intro

      mastermind = Mastermind.new
      response = nil
      mastermind.secret_code


      until response && response.status == :won
        print "> "
        input = gets.chomp
        response = mastermind.input_parser(input)
        puts response.message
      end
      puts "Goodbye!"

  elsif input == "i"
    printer.instructions

  elsif input == "q"
    printer.goodbye
    exit_game == true

  else
    printer.error_message

  end
end
