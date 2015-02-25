require_relative 'response'

class Mastermind

  attr_reader :secret, :spot_count, :char_count, :turn_count

  def initialize
    @secret = secret_code
    @turn_count = 0
  end


  def secret_code
    colors = ["R", "Y", "B", "G"]
    colors.map do |x|
      colors.shuffle.first
    end.join
  end

  def secret_code_for_tests
    @secret = "YGGB"
  end

  def guess_counter
    @turn_count += 1
  end


  def execute(input)
    if input == @secret
      guess_counter
      Response.new(:message => "You win! You guessed the sequence '#{@secret}' in #{@turn_count} guesses.", :status => :won)
    else
      guess_counter
      spot_count = eval_spot(input)
      char_count = eval_char(input)
      Response.new(:message => "#{input} has #{char_count} of the correct colors, with #{spot_count} in the correct position.\nYou've taken #{@turn_count}", :status => :continue)
    end
  end

  def eval_char(input)
    4 - (@secret.chars - input.chars).count
  end


  def eval_spot(input)
    input_ary = input.chars
    like_items = @secret.chars.zip(input_ary).select do |element|
      element[0] == element [1]
    end
    like_items.count
  end

  def input_parser(input)
    if input == "c" || input == "cheat"
      Response.new(:message => "The secret code is #{@secret}", :status => :continue)
    elsif input.size != 4
      Response.new(:message => "you must enter 4 letters", :status => :continue)
    else
      input.upcase!
      execute(input)
    end
  end

end


mm = Mastermind.new

mastermind = Mastermind.new
mastermind.secret_code_for_tests
input = "YBBR"
mastermind.input_parser(input)
mastermind.input_parser(input)
mastermind.turn_count
