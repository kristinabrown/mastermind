require_relative 'test_helper'
require './lib/mastermind_logic'
require './lib/printer'


class MastermindLogicTest < Minitest::Test

  def test_it_exists
    assert MastermindLogicTest
  end

  def test_it_can_respond_how_many_of_the_colors_are_correct
    mastermind = MastermindLogic.new
    secret = "YGGB"
    input = "YYGR"

    assert_equal 2, mastermind.eval_char(input, secret)
  end

  def test_it_can_respond_how_many_of_the_colors_are_correct_when_input_is_one_color
    mastermind = MastermindLogic.new
    secret = "YGGB"
    input = "GGGG"

    assert_equal 2, mastermind.eval_char(input, secret)
  end

  def test_it_can_respond_how_many_of_the_colors_are_correct_when_secret_is_one_color
    mastermind = MastermindLogic.new
    secret = "YYYY"
    input = "YYGR"

    assert_equal 2, mastermind.eval_char(input, secret)
  end

  def test_it_can_respond_how_many_of_the_colors_are_correct
    mastermind = MastermindLogic.new
    secret = "YGGB"
    input = "YYGR"

    assert_equal 2, mastermind.eval_char(input, secret)
  end

  def test_it_can_respond_how_many_colors_are_in_the_correct_position
    mastermind = MastermindLogic.new
    secret = "YGGB"
    input = "YYGR"

    assert_equal 2, mastermind.eval_spot(input, secret)
  end

  def test_it_can_respond_how_many_colors_are_in_different_correct_positions
    mastermind = MastermindLogic.new
    secret = "YYYY"
    input = "YGRB"

    assert_equal 1, mastermind.eval_spot(input, secret)
  end

  def test_it_can_respond_how_many_colors_are_in_correct_positions_when0
    mastermind = MastermindLogic.new
    secret = "YGGB"
    input = "GYRR"

    assert_equal 0, mastermind.eval_spot(input, secret)
  end

  def test_it_can_respond_how_many_colors_are_in_all_correct_positions
    mastermind = MastermindLogic.new
    secret = "YGGB"
    input = "YGGB"

    assert_equal 4, mastermind.eval_spot(input, secret)
  end

end
