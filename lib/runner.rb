require_relative 'game_play'
require_relative 'printer'
require_relative 'parser'

class Runner
  def the_game
    Printer.main_menu

    until @exit_game == true
      input = gets.chomp

      if quit?(input)
        Printer.seeya
        @exit_game = true
      else
        main_menu_options(input)
      end
    end
  end

  def main_menu_options(input)
    if play?(input)
      new_game = GamePlay.new
      Printer.play_intro
      secret = new_game.secret_code
      new_game.game_loop(secret)
    elsif instructions?(input)
      Printer.instructions
      the_game
    else
      Printer.error_message
      the_game
    end
  end

  def winner_menu
    Printer.menu_after_win
    input = gets.chomp

    if quit?(input)
      Printer.goodbye_after_win
      @exit_game = true
    elsif play?(input)
      main_menu_options(input)
    end
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
