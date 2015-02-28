require 'minitest/autorun'
require 'minitest/pride'
require './lib/game_play'

class GamePlayTest < Minitest::Test

#this doesn't work
  # def setup_suppress_output
  #   $stdout = StringIO.new
  # end

  def test_initialize
  end

  def test_it_can_respond_to
    mastermind = GamePlay.new

    assert_respond_to mastermind, :secret_code
  end

  def test_the_secret_code_is_the_right_length
    mastermind = GamePlay.new
    result = mastermind.secret_code

    assert_equal 4, result.size
  end

  def test_it_can_count_how_many_turns_youve_taken
    mastermind = GamePlay.new
    input = "yggy"
    secret = "ybbb"

    mastermind.execute(input, secret)
    mastermind.execute(input, secret)

    assert_equal 2, mastermind.turn_count
  end

  def test_it_can_stamp_a_start_time
    mastermind = GamePlay.new

    assert_respond_to mastermind, :start_time
  end

  def test_it_can_stamp_an_end_time
    mastermind = GamePlay.new
    input = "YYYY"
    secret = "YYYY"

    mastermind.execute(input, secret)
    assert_respond_to mastermind, :end_time
  end

  # def test_when_entering_game_loop_input_gets_executed
  #   mastermind = GamePlay.new
  #   secret = "YYYY"
  #   input = "YBYB"
  #   result = mastermind.game_loop(secret)
  #
  #   assert result.include?(" of the correct colors, ")
  # end

  def test_winner_sequence
  end

  def test_non_winner_sequence
  end

end
