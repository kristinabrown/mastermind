
class Response
  attr_reader :message, :status

  def initialize(inputs)
    @message = inputs[:message]
    @status  = inputs[:status]
  end

  def winner
    puts "You win! You guessed the sequence '#{@secret}' in #{@turn_count} guesses, in #{total_time}"
  end

  def evaluator_message
    "#{input} has #{char_count} of the correct colors, with #{spot_count} in the correct position.\nYou've taken #{@turn_count} guess(es)"
  end

  def cheater
    "The secret code is #{@secret}"
  end


end
