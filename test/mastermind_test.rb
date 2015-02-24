require 'minitest/autorun'
require 'minitest/pride'
require './lib/mastermind'

class MastermindTest < Minitest::Test
  def test_it_exists
    assert MastermindTest
  end

  def test_it_can_generate_a_random_combination
    skip
    mastermind = Mastermind.new
    assert_respond_to mastermind.secretcode
  end

  def test_it_can_respond_how_many_of_the_elements_are_correct
    skip
    mastermind = Mastermind.new
    @secret = "YGGB"
    input = "YYGR"
    mastermind.char_eval(input)
    assert_equal 2, mastermind.char_count
  end

  def test_it_can_respond_how_many_elements_are_in_the_correct_position
    mastermind = Mastermind.new
    @secret = "YGGB"
    input = "YYGR"
    mastermind.eval_spot(input)
    assert_equal 2, mastermind.spot_count
  end

  def test_it_can_respond_how_many_elements_are_in_different_corrent_positions
    mastermind = Mastermind.new
    @secret = "YGGB"
    input = "YGRB"
    mastermind.eval_spot(input)
    assert_equal 3, mastermind.spot_count
  end

  def test_it_can_receive_input_with_not_enough_characters
    mastermind = Mastermind.new
    input = "YYG"
    mastermind.input_parser(input)
    assert_equal  "you must enter 4 letters", response.message
  end

  def test_it_can_recieve_input_with_too_many_characters
    skip
    mastermind = Mastermind.new
    input = "YYGRR"
    assert_equal Response.new(:message => "you must enter 4 letters", :status => :continue), mastermind.input_parser(input)
  end

  def test_it_can_understand_downcase_characters
    mastermind = Mastermind.new
    input = "yygg"
    assert_equal "YYGG", mastermind.input_parser(input)
  end

  def test_it_can_print_the_secret_if_cheat
    skip
    mastermind = Mastermind.new
    @secret = "YGGB"
    input = "c"
    assert_equal Response.new(:message =>"the secret code is YGGB", :status => :continue), mastermind.input_parser(input)
  end

  def test_it_wins
    skip
    mm = Mastermind.new
    result = mm.execute("BBGB")
    assert result.message.downcase.include?("win")
  end
end
