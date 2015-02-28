require_relative 'test_helper'
require './lib/printer'


class PrinterTest < Minitest::Test

  def test_it_has_the_expected_main_menu_messages
    expected = [:greeting, :main_menu, :menu_after_win, :play_intro, :instructions, :goodbye, :error_message]

    expected.each do |message|
      assert Printer.respond_to?(message), "Printer should have a #{message} method"
    end
  end

  def test_it_has_the_expected_game_play_messages
    expected = [:winner, :evaluator_message, :cheater, :guess_too_short, :guess_too_long, :seeya]

    expected.each do |message|
      assert Printer.respond_to?(message), "Printer should have a #{message} method"
    end
  end

end
