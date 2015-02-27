require_relative 'game_play'

class MastermindLogic

  def secret_code_for_tests(x)
    if x == 1
      secret = "YGGB"
    else
      secret = "YYYY"
    end
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

end
