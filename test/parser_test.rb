require 'minitest/autorun'
require 'minitest/pride'
require './lib/parser'
require './lib/printer'

class ResponseTest < Minitest::Test

  def test_it_can_receive_input_with_not_enough_characters
    parser = Parser.new
    secret = "RRRR"
    input = "YYG"
    result = parser.input_parser(input, secret)

    assert result.include?("Your guess is too short!")
  end

  def test_it_can_recieve_input_with_too_many_characters
    skip
    secret = "RRRR"
    input = "YYGRR"
    result = Parser.input_parser(input, secret)

    assert result.include?("Your guess it too long!")
  end

  def test_it_can_understand_downcase_characters
    skip
    mastermind = MastermindLogic.new
    input = "yygg"
    result = mastermind.input_parser(input)
    assert result.message.include?("YYGG")
  end

  def test_it_can_print_the_secret_if_cheat
    skip
    mastermind = MastermindLogic.new
    mastermind.secret_code_for_tests
    input = "cheat"
    result = mastermind.input_parser(input)
    assert result.message.include?("the secret code is YGGB")
  end

  def test_it_can_print_the_secret_if_c
    skip #no message given?
    # secret code is YGGB
    mastermind = MastermindLogic.new
    mastermind.secret_code_for_tests(1)
    input = "c"
    result = mastermind.input_parser(input)
    assert result.message.include?("the secret code is YGGB")
  end

  def test_it_can_keep_track_of_the_play_time
    skip
    mastermind = MastermindLogic.new
    mastermind.secret_code_for_tests(1)
    input = "YGGB"
    result = mastermind.execute(input)
    assert result.message.include?("in   minutes and  ")
  end

end
