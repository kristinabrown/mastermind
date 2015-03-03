require_relative 'test_helper'
require './lib/game_play'

class GamePlayTest < Minitest::Test

  # you have to push 'q' twice to run through this test entirely

  def test_when_a_game_starts_it_has_0turns
    mastermind = GamePlay.new

    assert_equal 0, mastermind.turn_count
  end

  def test_when_a_game_starts_won_is_not_true
    mastermind = GamePlay.new

    assert_equal false, mastermind.won
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
    $stdout = StringIO.new
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
# this passes when the file is ran by itslef but fails when ran through rake test
  def test_it_can_stamp_an_end_time
    mastermind = GamePlay.new
    $stdout = StringIO.new
    input1 = "YBYB"
    input2 = "YYYY"
    secret = "YYYY"
    mastermind.execute(input1, secret)
    mastermind.execute(input2, secret)

    assert_respond_to mastermind, :end_time
  end

  def test_it_can_compute_the_total_min
    #test time 17 min 40 secdonds
    mastermind = GamePlay.new
    $stdout = StringIO.new
    mastermind.test_times

    assert_equal 17, mastermind.calculate_total_min
  end

  def test_it_can_compute_the_total_sec
    #test time 17 min 40 secdonds
    mastermind = GamePlay.new
    $stdout = StringIO.new
    mastermind.test_times

    assert_equal 40, mastermind.calculate_total_sec
  end

  def test_player_can_quit_while_in_game
    game = GamePlay.new
    input = "q"

    assert_equal true, game.quit?(input)
  end
  # this passes when the file is ran by itslef but fails when ran through rake test
  def test_it_can_distinguish_q_in_game_loop
    game = GamePlay.new
    $stdout = StringIO.new
    secret = "YYYY"
    game.game_loop(secret) do
      game.stub @input, "ybyb"
    end

    assert_equal false, game.quit?(@input)
  end
  
end
