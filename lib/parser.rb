require_relative 'printer'

class Parser
  def input_parser(input, secret)
    case
    when cheat?(input)
      Printer.cheater(secret)
      input
    when too_short?(input)
      Printer.guess_too_short
      input
    when too_long?(input)
      Printer.guess_too_long
      input
    else
      input.upcase!
      input
    end
  end

  def cheat?(input)
    input == "c" || input == "cheat"
  end

  def too_short?(input)
    input.size < 4
  end

  def too_long?(input)
    input.size > 4
  end
end
