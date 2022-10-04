require '../helpers/helpers'

class Day1

  include Helpers
  def initialize
    @puzzle_input = Helpers.read_puzzle_input
    p resultpart1(@puzzle_input)
    p resultpart2(@puzzle_input)
  end

  def resultpart1(input)
    input.count('(') - input.count(')')
    # An opening parenthesis, (, means he should go up one floor, and a closing parenthesis, ), means he should go down one floor.
    # To what floor do the instructions take Santa?
  end

  def resultpart2(input)
    temp = 0
    input.chars.each_with_index do |el, i|
      case el
      when '('
        temp += 1
      when ')'
        temp -= 1
      end
      return i + 1 if temp.negative?
    end
  end

  # What is the position (not index) of the character that causes Santa to first enter the basement?
end

Day1.new
