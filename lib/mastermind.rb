require_relative 'response'  # => true

class Mastermind

  attr_reader :secret, :spot_count, :char_count, :turn_count  # => nil

  def initialize
    @secret = secret_code  # => "BYBG", "BBGR"
    @turn_count = 0        # => 0, 0
  end


  def secret_code
    colors = ["R", "Y", "B", "G"]  # => ["R", "Y", "B", "G"], ["R", "Y", "B", "G"]
    4.times.map do |x|             # => #<Enumerator: 4:times>, #<Enumerator: 4:times>
      colors.shuffle.first         # => "B", "Y", "B", "G", "B", "B", "G", "R"
    end.join                       # => "BYBG", "BBGR"
  end

  def secret_code_for_tests(x)
    if x == 1                   # => true
      @secret = "YGGB"          # => "YGGB"
    else
      @secret = "YYYY"
    end                         # => "YGGB"
  end

  def guess_counter
    @turn_count += 1  # => 1
  end

  def start_time
    #if @turn_count == 1
      start_time = Time.new  # => 2015-02-25 11:07:13 -0700, 2015-02-25 11:07:13 -0700
      @start_time = "13, 55" #start_time.strftime("%M, %S")  # => "14, 38", "14, 38"
    #end
  end

  def end_time
    end_time = Time.new  # => 2015-02-25 11:07:13 -0700
    @end_time = "16, 42" #end_time.strftime("%M, %S")  # => "14, 38"
  end

  def total_time_equation
  end_array = @end_time.split(",")                            # => ["16", " 42"]
  start_array = @start_time.split(",")                        # => ["13", " 55"]
    total_time = end_array.zip(start_array).map do |element|  # => [["16", "13"], [" 42", " 55"]]
      element[0].to_i - element[1].to_i                       # => 3, -13
    end                                                       # => [3, -13]
    total_time.include?.map do |x|                            # ~> ArgumentError: wrong number of arguments (0 for 1)
      x < 0
    end
  end


  def execute(input)
    start_time                                                                                                                                                                                # => "13, 55"
    if input == @secret                                                                                                                                                                       # => false
      end_time
      total_time =  total_time_equation
      guess_counter
      Response.new(:message => "You win! You guessed the sequence '#{@secret}' in #{@turn_count} guesses, in #{total_time} ", :status => :won)
    else
      guess_counter                                                                                                                                                                           # => 1
      spot_count = eval_spot(input)                                                                                                                                                           # => 2
      char_count = eval_char(input)                                                                                                                                                           # => 2
      Response.new(:message => "#{input} has #{char_count} of the correct colors, with #{spot_count} in the correct position.\nYou've taken #{@turn_count} guess(es)", :status => :continue)  # => #<Response:0x007fe6808bdc10 @message="YYGP has 2 of the correct colors, with 2 in the correct position.\nYou've taken 1 guess(es)", @status=:continue>
    end                                                                                                                                                                                       # => #<Response:0x007fe6808bdc10 @message="YYGP has 2 of the correct colors, with 2 in the correct position.\nYou've taken 1 guess(es)", @status=:continue>
  end

  def eval_char(input)
    input_hash = input.chars.group_by do |char|         # => ["Y", "Y", "G", "P"]
      char                                              # => "Y", "Y", "G", "P"
    end                                                 # => {"Y"=>["Y", "Y"], "G"=>["G"], "P"=>["P"]}
    secret_hash = @secret.chars.group_by do |char|      # => ["Y", "G", "G", "B"]
      char                                              # => "Y", "G", "G", "B"
    end                                                 # => {"Y"=>["Y"], "G"=>["G", "G"], "B"=>["B"]}
    secret_hash.each.reduce(0) do |sum, (char, occur)|  # => #<Enumerator: {"Y"=>["Y"], "G"=>["G", "G"], "B"=>["B"]}:each>
      input_group = input_hash[char] || []              # => ["Y", "Y"], ["G"], []
      sum + [occur.size, input_group.size].min          # => 1, 2, 2
    end                                                 # => 2
  end

  def eval_spot(input)
    input_ary = input.chars                                        # => ["Y", "Y", "G", "P"]
    like_items = @secret.chars.zip(input_ary).select do |element|  # => [["Y", "Y"], ["G", "Y"], ["G", "G"], ["B", "P"]]
      element[0] == element [1]                                    # => true, false, true, false
    end                                                            # => [["Y", "Y"], ["G", "G"]]
    like_items.count                                               # => 2
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


mm = Mastermind.new  # => #<Mastermind:0x007fe6808c28c8 @secret="BYBG", @turn_count=0>

mastermind = Mastermind.new          # => #<Mastermind:0x007fe6808c1ba8 @secret="BBGR", @turn_count=0>
mastermind.secret_code_for_tests(1)  # => "YGGB"
input = "YYGP"                       # => "YYGP"
mastermind.execute(input)            # => #<Response:0x007fe6808bdc10 @message="YYGP has 2 of the correct colors, with 2 in the correct position.\nYou've taken 1 guess(es)", @status=:continue>
mastermind.end_time                  # => "16, 42"
mastermind.start_time                # => "13, 55"
mastermind.total_time_equation
mastermind.input_parser(input)
mastermind.turn_count

# ~> ArgumentError
# ~> wrong number of arguments (0 for 1)
# ~>
# ~> /Users/kristinabrown/homework/mastermind/mastermind/lib/mastermind.rb:50:in `include?'
# ~> /Users/kristinabrown/homework/mastermind/mastermind/lib/mastermind.rb:50:in `total_time_equation'
# ~> /Users/kristinabrown/homework/mastermind/mastermind/lib/mastermind.rb:114:in `<main>'
