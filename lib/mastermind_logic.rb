require_relative 'response'  # => false, true
require_relative 'printer'   # => false, false
require_relative 'parser'    # => true, false

class MastermindLogic

  attr_reader :secret, :turn_count, :start_time  # => nil, nil

  def initialize
    @turn_count = 0         # => 0, 0
    @start_time = Time.now  # => 2015-02-26 20:55:48 -0700, 2015-02-26 20:55:48 -0700
  end


  def secret_code
    colors = ["R", "Y", "B", "G"]
    4.times.map do |x|
      colors.shuffle.first
    end.join
  end

  def secret_code_for_tests(x)
    if x == 1
      secret = "YGGB"
    else
      secret = "YYYY"
    end
  end

  def guess_counter
    @turn_count += 1
  end

  def end_time
    @end_time = Time.now  # => 2015-02-26 20:55:48 -0700, 2015-02-26 20:55:48 -0700
  end

  def total_time_equation
    total_time = @end_time - @start_time  # => 3.4e-05, 1.2e-05
    @min = (total_time / 60).to_i         # => 0, 0
    @sec = (total_time % 60).to_s[0..2]   # => "3.4", "1.2"
  end

  def hasher_method(string)
    string.chars.group_by do |char|
      char
    end
  end

  def eval_char(input, secret)
    input_hash = hasher_method(input)
    secret_hash = hasher_method(secret)

    secret_hash.each.reduce(0) do |sum, (char, occur)|
      input_group = input_hash[char] || []
      sum + [occur.size, input_group.size].min
    end
  end

  def eval_spot(input, secret)
    input_ary = input.chars
    like_items = secret.chars.zip(input_ary).select do |element|
      element[0] == element [1]
    end
    like_items.count
  end

  def execute(input, secret)
    start_time
    if input == secret
      end_time
      total_time_equation
      guess_counter
      Printer.winner(secret, @min, @sec, @turn_count)
      @won = true
    else
      guess_counter
      spot_count = eval_spot(input, secret)
      char_count = eval_char(input, secret)
      Printer.evaluator_message(input, spot_count, char_count, @turn_count)
    end
  end

end

mastermind = MastermindLogic.new  # => #<MastermindLogic:0x007fd3c58adb30 @turn_count=0, @start_time=2015-02-26 20:55:48 -0700>, #<MastermindLogic:0x007fd3c58ac2a8 @turn_count=0, @start_time=2015-02-26 20:55:48 -0700>

mastermind.end_time  # => 2015-02-26 20:55:48 -0700, 2015-02-26 20:55:48 -0700

mastermind.total_time_equation  # => "3.4", "1.2"
