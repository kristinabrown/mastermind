
class Printer

  def greeting
    puts "Welcome to Mastermind"
  end

  def main_menu
    puts "Would you like to (p)lay, read the (i)nstructions, or (q)uit?"
  end

  def play_intro
    puts "I have generated a beginner sequence with four elements made up of: (r)ed,
(g)reen, (b)lue, and (y)ellow. Use (q)uit at any time to end the game.
What's your guess?"
  end

  def instructions
    puts "instructions"
  end
  
  def goodbye
    puts "until we meet again"
  end

  def error_message
    puts "please enter 'p' to play, 'q' to quit, or 'i' for instructions"
  end
# # def test_it_has_the_expected_messages
#   expected = [:welcome, :wrong_guess, :you_win]
#
#   printer = Printer.new
#   expected.each do |message|
#     assert printer.respond_to?(message), "Printer should have a #{message} method"
#   end
# end

end
