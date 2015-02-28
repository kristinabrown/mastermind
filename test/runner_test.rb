require_relative 'test_helper'
require './lib/runner'


class RunnerTest < Minitest::Test

  def test_it_can_distinguish_p
    runner = Runner.new
    input = "p"

    assert_equal true, runner.play?(input)
  end

  def test_it_can_distinguish_i
    runner = Runner.new
    input = "i"

    assert_equal true, runner.instructions?(input)
  end

  def test_it_can_distinguish_q
    runner = Runner.new
    input = "q"

    assert_equal true, runner.quit?(input)
  end

  def test_it_can_distinguish_play
    runner = Runner.new
    input = "play"

    assert_equal true, runner.play?(input)
  end

  def test_it_can_distinguish_instructions
    runner = Runner.new
    input = "instructions"

    assert_equal true, runner.instructions?(input)
  end

  def test_it_can_distinguish_quit
    runner = Runner.new
    input = "quit"

    assert_equal true, runner.quit?(input)
  end

  def test_it_can_distinguish_if_i_through_main_menu
    runner = Runner.new
    $stdout = StringIO.new
    input = "i"
    result = runner.main_menu_options(input)


    assert_equal false, runner.play?(result)
  end

end
