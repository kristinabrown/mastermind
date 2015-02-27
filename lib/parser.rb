require_relative 'printer'
require_relative 'mastermind_logic'



module Parser

  def self.input_parser(input, secret)
    if input == "c" || input == "cheat"
      Printer.cheater(secret)
    elsif input == "q" || input == "quit"
      Printer.goodbye
      @main_menu = true
      @exit_game = true
    elsif input.size < 4
      Printer.guess_too_short
    elsif input.size > 4
      Printer.guess_too_long
    else
      input.upcase!
      MastermindLogic.new.execute(input, secret)
    end
  end

end
