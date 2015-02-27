require 'minitest/autorun'
require 'minitest/pride'
require './lib/mastermind_logic'
require './lib/printer'

#split up the parser

class MastermindLogicTest < Minitest::Test
  def test_it_exists
    assert MastermindLogicTest
  end

  def test_it_can_generate_a_random_combination
    mastermind = MastermindLogic.new
    assert_respond_to mastermind, :secret_code
  end

  def test_can_break_up_the_input_in_a_hash_based_on_color
    skip
    mastermind = MastermindLogic.new
    input = "YYGR"
    assert.equal "YYGR", mastermind.hasher_method(input)
  end

  def test_it_can_respond_how_many_of_the_colors_are_correct
    #secret code = YGGB
    mastermind = MastermindLogic.new
    mastermind.secret_code_for_tests(1)
    input = "YYGR"
    assert_equal 2, mastermind.eval_char(input)
  end

  def test_it_can_respond_how_many_of_the_colors_are_correct_when_input_is_one_color
    #secret code = YGGB
    mastermind = MastermindLogic.new
    mastermind.secret_code_for_tests(1)
    input = "GGGG"
    assert_equal 2, mastermind.eval_char(input)
  end

  def test_it_can_respond_how_many_of_the_colors_are_correct_when_secret_is_one_color
    #secret code = YYYY
    mastermind = MastermindLogic.new
    mastermind.secret_code_for_tests(2)
    input = "YYGR"
    assert_equal 2, mastermind.eval_char(input)
  end

  def test_it_can_respond_how_many_of_the_colors_are_correct
    #secret code = YGGB
    mastermind = MastermindLogic.new
    mastermind.secret_code_for_tests(1)
    input = "YYGR"
    assert_equal 2, mastermind.eval_char(input)
  end

  def test_it_can_respond_how_many_colors_are_in_the_correct_position
    #secret code = YGGB
    mastermind = MastermindLogic.new
    mastermind.secret_code_for_tests(1)
    input = "YYGR"
    assert_equal 2, mastermind.eval_spot(input)
  end

  def test_it_can_respond_how_many_colors_are_in_different_correct_positions
    #secret code = YYYY
    mastermind = MastermindLogic.new
    mastermind.secret_code_for_tests(2)
    input = "YGRB"
    assert_equal 1, mastermind.eval_spot(input)
  end

  def test_it_can_respond_how_many_colors_are_in_correct_positions_when0
    #secret code = YGGB
    mastermind = MastermindLogic.new
    mastermind.secret_code_for_tests(1)
    input = "GYRR"
    assert_equal 0, mastermind.eval_spot(input)
  end

  def test_it_can_respond_how_many_colors_are_in_all_correct_positions
    #secret code = YGGB
    mastermind = MastermindLogic.new
    mastermind.secret_code_for_tests(1)
    input = "YGGB"
    assert_equal 4, mastermind.eval_spot(input)
  end

  def test_it_can_count_how_many_turns_youve_taken
    # secret code is YGGB
    mastermind = MastermindLogic.new
    mastermind.secret_code_for_tests(1)
    input = "yggy"
    mastermind.input_parser(input)
    mastermind.input_parser(input)
    assert_equal 2, mastermind.turn_count
  end

  def test_it_can_stamp_a_start_time
    mastermind = MastermindLogic.new
    assert_respond_to mastermind, :start_time
  end

  def test_it_can_stamp_an_end_time
    mastermind = MastermindLogic.new
    input = "YYYY"
    mastermind.execute(input)
    assert_respond_to mastermind, :end_time
  end



end
