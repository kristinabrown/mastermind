require 'minitest/autorun'
require 'minitest/pride'
require './lib/mastermind'
require './lib/printer'

#split up the parser

class MastermindTest < Minitest::Test
  def test_it_exists
    assert MastermindTest
  end

  def test_it_can_generate_a_random_combination
    skip
    mastermind = Mastermind.new
    assert mastermind.respond_to?(secret_code)
  end

  def test_can_break_up_the_input_in_a_hash_based_on_color
    skip
    mastermind = Mastermind.new
    input = "YYGR"
    assert.equal "YYGR", mastermind.hasher_method(input)
  end

  def test_it_can_respond_how_many_of_the_colors_are_correct
    #secret code = YGGB
    mastermind = Mastermind.new
    mastermind.secret_code_for_tests(1)
    input = "YYGR"
    assert_equal 2, mastermind.eval_char(input)
  end

  def test_it_can_respond_how_many_of_the_colors_are_correct_when_input_is_one_color
    #secret code = YGGB
    mastermind = Mastermind.new
    mastermind.secret_code_for_tests(1)
    input = "GGGG"
    assert_equal 2, mastermind.eval_char(input)
  end

  def test_it_can_respond_how_many_of_the_colors_are_correct_when_secret_is_one_color
    #secret code = YYYY
    mastermind = Mastermind.new
    mastermind.secret_code_for_tests(2)
    input = "YYGR"
    assert_equal 2, mastermind.eval_char(input)
  end

  def test_it_can_respond_how_many_of_the_colors_are_correct
    #secret code = YGGB
    mastermind = Mastermind.new
    mastermind.secret_code_for_tests(1)
    input = "YYGR"
    assert_equal 2, mastermind.eval_char(input)
  end

  def test_it_can_respond_how_many_colors_are_in_the_correct_position
    #secret code = YGGB
    mastermind = Mastermind.new
    mastermind.secret_code_for_tests(1)
    input = "YYGR"
    assert_equal 2, mastermind.eval_spot(input)
  end

  def test_it_can_respond_how_many_colors_are_in_different_correct_positions
    #secret code = YYYY
    mastermind = Mastermind.new
    mastermind.secret_code_for_tests(2)
    input = "YGRB"
    assert_equal 1, mastermind.eval_spot(input)
  end

  def test_it_can_respond_how_many_colors_are_in_correct_positions_when0
    #secret code = YGGB
    mastermind = Mastermind.new
    mastermind.secret_code_for_tests(1)
    input = "GYRR"
    assert_equal 0, mastermind.eval_spot(input)
  end

  def test_it_can_respond_how_many_colors_are_in_all_correct_positions
    #secret code = YGGB
    mastermind = Mastermind.new
    mastermind.secret_code_for_tests(1)
    input = "YGGB"
    assert_equal 4, mastermind.eval_spot(input)
  end

  def test_it_can_receive_input_with_not_enough_characters
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
    input = "cheat"
    result = mastermind.input_parser(input)
    assert result.message.include?("the secret code is YGGB")
  end

  def test_it_can_print_the_secret_if_c
    skip #no message given?
    # secret code is YGGB
    mastermind = Mastermind.new
    mastermind.secret_code_for_tests(1)
    input = "c"
    result = mastermind.input_parser(input)
    assert result.message.include?("the secret code is YGGB")
  end

  def test_it_can_count_how_many_turns_youve_taken
    # secret code is YGGB
    mastermind = Mastermind.new
    mastermind.secret_code_for_tests(1)
    input = "yggy"
    mastermind.input_parser(input)
    mastermind.input_parser(input)
    assert_equal 2, mastermind.turn_count
  end

  def test_it_can_stamp_a_start_time
    skip
    # secret code is YGGB
    mastermind = Mastermind.new
    mastermind.secret_code_for_tests(1)
    input = "YGGB"
    result = mastermind.execute(input)
    assert result.message.include?("in ")
  end

  def test_it_can_keep_track_of_the_play_time
    skip
    mastermind = Mastermind.new
    mastermind.secret_code_for_tests
    input = "YGGB"
    mastermind.execute(input)
    assert result.message.include?("in ")
  end


end

class PrinterTest < Minitest::Test

  def test_it_has_the_expected_messages
    expected = [:greeting, :main_menu, :play_intro, :instructions, :goodbye, :error_message]

    expected.each do |message|
      assert Printer.respond_to?(message), "Printer should have a #{message} method"
    end
  end

end
