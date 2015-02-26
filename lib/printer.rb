require 'colorize'
require_relative 'mastermind'

module Printer

  def self.greeting

    print "\e[2J\e[f"
    puts "Welcome to"
    puts'  ______  ___             _____                       _____       _________'.colorize(:red)
    puts'  ___   |/  /_____ _________  /___________________ ______(_)____________  /'.colorize(:blue)
    puts'  __  /|_/ /_  __ `/_  ___/  __/  _ \_  ___/_  __ `__ \_  /__  __ \  __  / '.colorize(:yellow)
    puts'  _  /  / / / /_/ /_(__  )/ /_ /  __/  /   _  / / / / /  / _  / / / /_/ /  '.colorize(:green)
    puts'  /_/  /_/  \__,_/ /____/ \__/ \___//_/    /_/ /_/ /_//_/  /_/ /_/\__,_/   '.colorize(:magenta)

    puts "\n"
    puts "\n"
    puts "\n"
  end

  def self.main_menu
    puts "Would you like to (p)lay, read the (i)nstructions, or (q)uit?"
  end

  def self.menu_after_win
    "Do you want to (p)lay again or (q)uit?"
  end

  def self.play_intro
    puts "I have generated a beginner sequence with four elements made up of: (r)ed,
(g)reen, (b)lue, and (y)ellow. Use (q)uit at any time to end the game.
What's your guess?"
  end

  def self.instructions
    puts "When you start a game a random 4-character-combination of (R)ed, (G)reen,
(B)lue, and (Yellow) is created (ex. RRYB). You have to guess the sequence. With
each guess you will be told how many colors are correct, and how many are in the
correct position. Good Luck!"
  end

  def self.goodbye
    puts "Come back any time!"
  end

  def self.error_message
    puts "please enter 'p' to play, 'q' to quit, or 'i' for instructions"
  end


end
