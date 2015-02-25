require 'minitest/autorun'
require 'minitest/pride'
require './lib/mastermind'

#split up the parser

class MastermindTest < Minitest::Test
  def test_it_exists
    assert MastermindTest
  end

  def test_it_can_generate_a_random_combination
    skip
    mastermind = Mastermind.new
    assert respond_to(mastermind.secret_code)
  end

  def test_it_can_respond_how_many_of_the_elements_are_correct
    skip
    mastermind = Mastermind.new
    mastermind.secret_code_for_tests
    input = "YYGR"
    assert_equal 2, mastermind.eval_char(input)
  end

  def test_it_can_respond_how_many_elements_are_in_the_correct_position
    mastermind = Mastermind.new
    mastermind.secret_code_for_tests
    input = "YYGR"
    assert_equal 2, mastermind.eval_spot(input)
  end

  def test_it_can_respond_how_many_elements_are_in_different_correct_positions
    mastermind = Mastermind.new
    mastermind.secret_code_for_tests
    input = "YGRB"
    assert_equal 3, mastermind.eval_spot(input)
  end

  def test_it_can_receive_input_with_not_enough_character
    mastermind = Mastermind.new
    input = "YYG"
    result = mastermind.input_parser(input)
    assert result.message.include?("you must enter 4 letters")
  end

  def test_it_can_recieve_input_with_too_many_characters
    mastermind = Mastermind.new
    input = "YYGRR"
    result = mastermind.input_parser(input)
    assert result.message.include?("you must enter 4 letters")
  end

  def test_it_can_understand_downcase_characters
    mastermind = Mastermind.new
    input = "yygg"
    result = mastermind.input_parser(input)
    assert result.message.include?("YYGG")
  end

  def test_it_can_print_the_secret_if_cheat
    skip
    mastermind = Mastermind.new
    mastermind.secret_code_for_tests
    input = "c"
    result = mastermind.input_parser(input)
    assert result.message.include?("the secret code is YGGB")
  end

  def test_it_can_count_how_many_turns_youve_taken
    mastermind = Mastermind.new
    mastermind.secret_code_for_tests
    input = "yggy"
    mastermind.input_parser(input)
    mastermind.input_parser(input)
    assert_equal 2, mastermind.turn_count
  end

  def test_it_wins
    skip
    mm = Mastermind.new
    result = mm.execute("BBGB")
    assert result.message.downcase.include?("win")
  end
end
