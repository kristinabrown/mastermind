require_relative 'game_play'

class MastermindLogic
  def hash_by_character(input)
    input.chars.group_by{ |char| char }
  end

  def eval_char(input, secret)
    input_hash = hash_by_character(input)
    secret_hash = hash_by_character(secret)

    secret_hash.each.reduce(0) do |sum, (char, occur)|
      input_group = input_hash[char] || []
      sum + [occur.size, input_group.size].min
    end
  end

  def eval_spot(input, secret)
    like_items = secret.chars.zip(input.chars).select do |element|
      element[0] == element[1]
    end
    like_items.count
  end
end
