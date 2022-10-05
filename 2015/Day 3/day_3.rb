require '../helpers/helpers'

class Day3
  include Helpers
  def initialize
    @puzzle_input = Helpers.read_puzzle_input
    p resultpart1(@puzzle_input)
    p resultpart2(@puzzle_input)
  end

  def journey(magical)
    current_coord = {x:0, y:0}
    visited_coords = []
    magical.chars.each do |i|
      visited_coords << current_coord.clone
      case i
      when "^"
        current_coord[:y] += 1
        visited_coords << current_coord
      when "v"
        current_coord[:y] -= 1
        visited_coords << current_coord
      when "<"
        current_coord[:x] -= 1
        visited_coords << current_coord
      when ">"
        current_coord[:x] += 1
        visited_coords << current_coord
      end
    end
    visited_coords.uniq.length
  end

  def resultpart1(magical)
    journey(magical)
  end

  def resultpart2(magical)
    # not my solution fully broke my brain
    santas = [[0,0], [0,0]].cycle
    houses = {[0,0] => 1}
    magical.chars.each do |i|
      position = santas.next
      case i
      when '>'; position[0] += 1
      when '<'; position[0] -= 1
      when '^'; position[1] -= 1
      when 'v'; position[1] += 1
      end
      houses[[position[0], position[1]]] = 1
    end
    houses.length
  end
end

Day3.new
# Instead, I would suggest having a normal class that only uses a hash as an internal data structure (which could be easily and idiomatically exposed with a to_h method).

