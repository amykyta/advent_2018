require 'pry'

class Day5
  def self.annihilate(input)
    ok = input.split('').tap { |f| f.pop() }
    self.ann(ok).join('')
  end

  def self.annihilation_condition(left, right)
    # ascii values are 32 apart for case
    (left.ord - right.ord).abs == 32
  end

  def self.ann(input)
    remaining_size = input.count

    if remaining_size == 1
      input
    elsif remaining_size == 2
      if self.annihilation_condition(*input)
        # annihilate
        nil
      else
        # return unchanged
        input
      end
    else
      half = remaining_size / 2
      left = self.ann(input.slice(0...half))
      right = self.ann(input.slice(half..-1))

      self.merge(left, right)

    end
  end

  def self.merge(left, right)
    if !left || left == []
      right
    elsif !right || right == []
      left
    elsif self.annihilation_condition(left[-1], right[0])
      self.merge(left.slice(0..-2), right.slice(1..-1))
    else
      left.push(*right)
    end
  end
end

if __FILE__ == $0
  File.open('input', 'r') do |f|
    puts "Day1 - #{Day5.annihilate(f.read).size}"
  end
end
