require 'minitest/autorun'
require 'minitest/pride'
require './lib/mastermind'

class MastermindTest < Minitest::Test
  def test_it_exists
    assert MastermindTest
  end

  def test_it_can_generate_a_random_combination
    mastermind = Mastermind.new
    assert_respond_to mastermind(initiate)
  end

  def test_it_wins
    skip
    mm = Mastermind.new
    result = mm.execute("BBGB")
    assert result.message.downcase.include?("win")
  end
end
