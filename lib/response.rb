require_relative 'printer'

class Response
  attr_reader :message, :status

  def initialize(inputs)
    @message = inputs[:message] #printer.message
    @status  = inputs[:status]
  end



end
