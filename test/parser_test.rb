require_relative 'test_helper'
require './lib/parser'

class ResponseTest < Minitest::Test


  def test_it_can_distinguish_if_c
    parser = Parser.new
    input = "c"

    assert_equal true, parser.cheat?(input)
  end

  def test_it_can_distinguish_if_cheat
    parser = Parser.new
    input = "cheat"

    assert_equal true, parser.cheat?(input)
  end

  def test_it_can_distinguish_too_short_of_input
    parser= Parser.new
    input = "yyy"

    assert_equal true, parser.too_short?(input)
  end

  def test_it_can_distinguish_too_long
    parser = Parser.new
    input = "yyyyyy"

    assert_equal true, parser.too_long?(input)
  end

  def test_it_can_distinguish_if_c_through_main_parser
    parser = Parser.new
    $stdout = StringIO.new
    input = "c"
    secret = "YYYY"
    result = parser.input_parser(input, secret)


    assert_equal true, parser.cheat?(result)
  end

  def test_it_can_distinguish_if_too_long_through_main_parser
    parser = Parser.new
    $stdout = StringIO.new
    input = "YYYYYYYY"
    secret = "YYYY"
    result = parser.input_parser(input, secret)


    assert_equal true, parser.too_long?(result)
  end

  def test_it_can_distinguish_if_too_short_through_main_parser
    parser = Parser.new
    $stdout = StringIO.new
    input = "YY"
    secret = "YYYY"
    result = parser.input_parser(input, secret)


    assert_equal true, parser.too_short?(result)
  end

  def test_it_can_upcase_the_input
    parser = Parser.new
    input = "yybb"
    secret = "YYYY"

    assert_equal "YYBB", parser.input_parser(input, secret)
  end


end
