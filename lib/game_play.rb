require_relative 'mastermind_logic'
require_relative 'printer'
require_relative 'parser'
#require_relative 'mastermind'

class GamePlay

  attr_reader :turn_count, :start_time, :won

  def initialize
    @turn_count = 0
    @start_time = Time.now
    @won = false
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
      print ">"
      input = gets.chomp
      Parser.input_parser(input, secret)
    end
  end

  def execute(input, secret)
    @start_time
    if input == secret
      winner_sequence
      Printer.winner(secret, @min, @sec, @turn_count)
      Runner.new.winner_menu
      @won == true
    else
      non_winner_sequence(input, secret)
      Printer.evaluator_message(input, @spot_count, @char_count, @turn_count)
    end
  end

  def winner_sequence
    guess_counter
    end_time
    total_time_equation
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

  def total_time_equation
    total_time = @end_time - @start_time
    @min = (total_time / 60).to_i
    @sec = (total_time % 60).to_s[0..2]
  end


end
