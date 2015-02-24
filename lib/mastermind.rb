require_relative 'response'

class Mastermind

  attr_reader :secret, :spot_count, :char_count

  def initialize
    @secret = secret
  end


  def secret_code
    @colors = ["R", "Y", "B", "G"]
    @secret = []
    @colors.map do |x|
      @secret << @colors.shuffle.first
    end
    @secret = @secret.join
    puts @secret
  end




  def execute(input)
    if input == @secret
      Response.new(:message => "You win!", :status => :won)
    else
      eval_spot(input)
      eval_char(input)
      Response.new(:message => "#{input} has #{@char_count} of the correct elements, with #{@spot_count} in the right correct position", :status => :continue)
    end
  end

  def eval_char(input)
    "you have some correct"
    @char_count = 2
    # @secret = "YGGB"
    # secret_ary = @secret.chars
    # @char_count = 0
    # input.chars.each do |x|
    #      secret_ary.any? do |num|
    #       if x == num
    #         @char_count += 1
    #         num.
    #       end
    #     end
    # end
    # @char_count
  end


  def eval_spot(input)
    @spot_count = 0
    input_ary = input.chars
    combo = @secret.chars.zip(input_ary)
    combo.map do |set|
      if set[0] == set[1]
        @spot_count += 1
      end
    end
    Response.new(:message => "#{@spot_count} in correct position", :status => :continue)
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
mastermind.secret_code
input = "yfdR"
mastermind.eval_char(input)
mastermind.eval_spot(input)
