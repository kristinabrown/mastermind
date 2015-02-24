
class Printer

  def greeting
    puts "Welcome to Mastermind"
    puts "Would you like to (p)lay, read the (i)nstructions, or (q)uit?"
  end

  def play_intro
    puts "I have generated a beginner sequence with four elements made up of: (r)ed,
(g)reen, (b)lue, and (y)ellow. Use (q)uit at any time to end the game.
What's your guess?"
  end

  def instructions
    "instructions"
  end

  def goodbye
    "until we meet again"
  end

  def error_message
    "please enter 'p' to play, 'q' to quit, or 'i' for instructions"
  end


end
