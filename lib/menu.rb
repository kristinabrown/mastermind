require_relative 'game_play'
require_relative 'printer'
require_relative 'parser'
require_relative 'mastermind'

class Menu

  def main_menu_options(input)
    case
    when play?
      Printer.play_intro
      secret = game.secret_code
      game.game_loop(secret)
      @exit_menu = true

    when instructions?
      Printer.instructions
      @exit_menu = true

    when quit?
      Printer.goodbye
      @exit_menu = true
      @exit_game = true

    else
      Printer.error_message
      @exit_menu = true
    end
  end

  def play?
    input == "p" || input == "play"
  end

  def instructions?
    input == "i" || input == "instructions"
  end

  def quit?
    input == 'q' || input == 'quit'
  end
end
