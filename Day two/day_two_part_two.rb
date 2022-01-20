class DayTwo
  def initialize(input)
    @plots = { hPos: 0, depth: 0, aim: 0 }
    @input = parse_input(input)
  end

  def parse_input(input)
    input.split("\n")
  end

  def solve
    @input.each do |command|
      direction, magnitude = command.split(' ')
      case direction
      when 'forward'
        @plots[:hPos] += magnitude.to_i
        @plots[:depth] += (@plots[:aim] * magnitude.to_i)
      when 'down'
        @plots[:aim] += magnitude.to_i
      when 'up'
        @plots[:aim] -= magnitude.to_i
      end
    end
    @plots[:hPos] * @plots[:depth]
  end
end

file_data = File.read('day_two_part_one.txt')
test = DayTwo.new(file_data)
p test.solve
