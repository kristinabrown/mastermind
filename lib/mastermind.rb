require_relative 'response'
require_relative 'printer'


class Mastermind

  attr_reader :secret, :turn_count

  def initialize
    @secret = secret_code
    @turn_count = 0
  end


  def secret_code
    colors = ["R", "Y", "B", "G"]
    4.times.map do |x|
      colors.shuffle.first
    end.join
  end

  def secret_code_for_tests(x)
    if x == 1
      @secret = "YGGB"
    else
      @secret = "YYYY"
    end
  end

  def guess_counter
    @turn_count += 1
  end

  def start_time
    if @turn_count == 1
      @start_time = Time.new
    end
  end

  def end_time
    @end_time = Time.new
  end

  def time_formatter(time)
    time.strftime("%M, %S").split(",")
  end

  def total_time_equation
  end_array = time_formatter(@end_time)
  start_array = time_formatter(@start_time)
    total_time = end_array.zip(start_array).map do |element|
      element[0].to_i - element[1].to_i
    end
  end

  def hasher_method(string)
    string.chars.group_by do |char|
      char
    end
  end

  def eval_char(input)
    input_hash = hasher_method(input)
    secret_hash = hasher_method(@secret)

    secret_hash.each.reduce(0) do |sum, (char, occur)|
      input_group = input_hash[char] || []
      sum + [occur.size, input_group.size].min
    end
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

  def execute(input)
    start_time
    if input == @secret
      end_time
      total_time =  total_time_equation
      guess_counter
      Response.new(:message => "You win! You guessed the sequence '#{@secret}' in #{@turn_count} guesses, in #{total_time}", :status => :won)
    else
      guess_counter
      spot_count = eval_spot(input)
      char_count = eval_char(input)
      Response.new(:message => "#{input} has #{char_count} of the correct colors, with #{spot_count} in the correct position.\nYou've taken #{@turn_count} guess(es)", :status => :continue)
    end
  end

end


mm = Mastermind.new

mastermind = Mastermind.new
mastermind.secret_code_for_tests(1)
input = "YYGP"
mastermind.execute(input)
mastermind.end_time
mastermind.start_time
mastermind.total_time_equation
mastermind.input_parser(input)
mastermind.turn_count
