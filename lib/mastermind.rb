require_relative 'response'

class Mastermind


  def initiate
    @colors = ["R", "Y", "B", "G"]
    @secret = []
    @colors.map do |x|
      @secret << @colors.shuffle.first
    end
    puts @secret.join
  end


  # def execute(input)
  #   secret = "BBGB"
  #   if input == secret
  #     Response.new(:message => "You Win!", :status => :won)
  #   else
  #     Response.new(:message => "Guess again!", :status => :continue)
  #   end
  # end
end

mm = Mastermind.new

mm.initiate
