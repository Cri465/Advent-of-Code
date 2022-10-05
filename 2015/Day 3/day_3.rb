require_relative 'house'

class Day3
  def initialize
    x = "^>v<".chars
    # journey(x)
    test
  end

  def opposite_direction(char)
    { "^" => "v", "v" => "^", "<" => ">", ">" => "<" }[char]
  end

  def journey(magical)
    acc = 0
    first_house = House.new
    current_house = first_house
    magical.each do |i|
      if current_house[i].nil?
        temp = House.new()
        temp[opposite_direction(i)] = current_house
        current_house = temp
        acc += 1
      else
        current_house = current_house[i]
      end
    end
    acc
  end

  def test
    temp = House.new
    temp["^"] = "bones"
    p temp["^"]
  end
end

Day3.new
# Instead, I would suggest having a normal class that only uses a hash as an internal data structure (which could be easily and idiomatically exposed with a to_h method).

