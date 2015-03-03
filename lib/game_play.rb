require_relative 'mastermind_logic'
require_relative 'runner'

class GamePlay
  attr_reader :turn_count, :start_time, :won

  def initialize
    @turn_count = 0
    @start_time = Time.now
    @won        = false
  end

  def secret_code
    colors = ["R", "Y", "B", "G"]
    4.times.map do |x|
      colors.shuffle.first
    end.join
  end

  def guess_counter
    @turn_count += 1
  end

  def game_loop(secret)
    until @won == true
      Printer.input_prompter
      input = gets.chomp
      if quit?(input)
        Printer.goodbye
        break
      else
        parse_and_execute(input, secret)
      end
    end
  end

  def quit?(input)
    input == "q" || input == "quit"
  end

  def parse_and_execute(input, secret)
    parsed_input = Parser.new.input_parser(input, secret)
    if parsed_input.size == 4
      execute(parsed_input, secret)
    end
  end

  def execute(input, secret)
    @start_time
    if input == secret
      winner_sequence

      Printer.winner(secret, @min, @sec, @turn_count)
      @won = true
      Runner.new.winner_menu
    else
      non_winner_sequence(input, secret)
      Printer.evaluator_message(input, @spot_count, @char_count, @turn_count)
    end
  end

  def winner_sequence
    guess_counter
    end_time
    @min = calculate_total_min
    @sec = calculate_total_sec
  end

  def non_winner_sequence(input, secret)
    guess_counter
    mastermind = MastermindLogic.new
    @spot_count = mastermind.eval_spot(input, secret)
    @char_count = mastermind.eval_char(input, secret)
  end

  def end_time
    @end_time = Time.now
  end

  def calculate_total_min
    total_time = @end_time - @start_time
    (total_time / 60).to_i
  end

  def calculate_total_sec
    total_time = @end_time - @start_time
    (total_time % 60).to_s[0..1].to_i
  end

  def test_times
    @start_time = Time.new(2015, 02, 28, 07, 41, 03)
    @end_time   = Time.new(2015, 02, 28, 07, 58, 43)
  end
end
