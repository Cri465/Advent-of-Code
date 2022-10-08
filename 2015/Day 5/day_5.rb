require '../helpers/helpers'

class Day5
  def initialize
    @puzzle_input = Helpers.read_puzzle_input.split("\n")
    resultpart1
  end

  def resultpart1
    nice_strings = []
    @puzzle_input.each do |str|
      next if str =~ /ab|cd|pq|xy/
      next unless str.count("aeiou") >= 3

      nice_strings << str if double_char(str)
    end
    p nice_strings.length
  end

  def double_char(string)
    chars = string.chars
    chars.each_with_index do |char, index|
      return true if char == chars[index + 1]
    end
    false
  end
end

Day5.new
