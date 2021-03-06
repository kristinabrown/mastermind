require 'colorize'
require 'cheerio'

module Printer
  def self.greeting
    print "\e[2J\e[f"
    puts Cheerio.hello
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

  def self.input_prompter
    print ">"
  end

  def self.main_menu
    puts "Would you like to (p)lay, read the (i)nstructions, or (q)uit?"
  end

  def self.menu_after_win
    puts "Do you want to (p)lay again or (q)uit?"
  end

  def self.goodbye_after_win
    puts "Thanks for playing!"
    puts "('q' one more time)"
  end

  def self.play_intro
    puts "I have generated a beginner sequence with four elements made up of: (r)ed,
(g)reen, (b)lue, and (y)ellow. Use (q)uit at any time to end the game.
What's your guess?"
  end

  def self.instructions
    puts "When you start a game of Mastermind a random 4-character-combination of (R)ed, (G)reen,
(B)lue, and (Y)ellowis created (ex. RRYB). You have to guess the sequence. With
each guess you will be told how many colors are correct, and how many are in the
correct position. Good Luck!"
  end

  def self.goodbye
    puts Cheerio.goodbye
    puts "('q' one more time)"
  end

  def self.seeya
    puts Cheerio.goodbye
  end

  def self.error_message
    puts "please enter 'p' to play, 'q' to quit, or 'i' for instructions"
  end

  def self.winner(secret, min, sec, turn_count)
    puts "You win! You guessed the sequence '#{secret}' in #{turn_count} guesses, in #{min} minute(s) and #{sec} seconds. That's pretty good!"
  end

  def self.evaluator_message(input, spot_count, char_count, turn_count)
    puts "#{input} has #{char_count} of the correct colors, with #{spot_count} in the correct position.\nYou've taken #{turn_count} guess(es)"
  end

  def self.cheater(secret)
    puts "The secret code is #{secret}"
  end

  def self.guess_too_short
    puts "Your guess is too short! You must enter 4 letters."
  end

  def self.guess_too_long
    puts "Your guess is too long! You must enter 4 letters."
  end
end
