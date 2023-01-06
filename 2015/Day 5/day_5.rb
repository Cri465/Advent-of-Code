require '../helpers/helpers'

class Day5
  def initialize
    @puzzle_input = Helpers.read_puzzle_input.split("\n")
    p resultpart1
    p resultpart2
  end

  def pair_appears_twice(str)
    pairs = str.chars.each_cons(2).to_a.chunk(&:itself).map(&:first)
    pairs.length != pairs.uniq.length
  end

  def repeat_with_single_letter_between(str)
    chars = str.chars
    repeating_character_indexes = chars.each.map{|char| check_character(char, str) }.reject{|i| i.length < 2 }
    repeating_character_indexes.map{|i| find_distance_between_letters(i) }.include?(true)
  end

  def check_character(character, str)
    str.chars.each_with_index.map{|char, index| char == character ? index : nil }.compact.reject(&:zero?)
  end

  def find_distance_between_letters(arr)
    distance_check(arr.product(arr).map{|a, b| a - b })
  end

  def distance_check(arr)
    arr.include?(2)
  end

  def naughtyornicepart1(str)
    return false if str =~ /ab|cd|pq|xy/
    return false unless str.count("aeiou") >= 3
    double_char?(str)
  end

  def resultpart1
    nice_strings = []
    @puzzle_input.each do |str|
      nice_strings << str if naughtyornicepart1(str)
    end
    @resultpart1 = nice_strings.length
  end

  def naughtyornicepart2(str)
    return false unless pair_appears_twice(str)
    repeat_with_single_letter_between(str)
  end

  def resultpart2
    @puzzle_input.inject(0){|c, s| (s.scan(/(..).*\1/).length > 0) && (s.scan(/(.).\1/).length > 0) && c+=1; c }
    #fucking what
  end

  def double_char?(string)
    chars = string.chars
    chars.each_with_index do |char, index|
      return true if char == chars[index + 1]
    end
    false
  end
end

p Day5.new.naughtyornicepart2("xlqwdrytzwnxzwzv")
