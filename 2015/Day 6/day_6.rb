require '../helpers/helpers'

class Day_6
  def initialize
    @puzzle_input = Helpers.read_puzzle_input.split("\n")
    @grid = []
    1000.times do |i|
      @grid[i] = Array.new(1000, false)
    end
  end

  def toggle_lights(instruction)
    p instruction
  end
  def process_instructions
    @puzzle_input.each do |i|
      plain_instruction = i.split
      instruction = plain_instruction[0] == "toggle" ? plain_instruction[0] : plain_instruction.first(2).join(" ")
      coordinates = plain_instruction.last(3).reject{|i| i == "through"}
      p parsed_instruction = coordinates.insert(0, instruction)
    end
  end

  def result_p1

  end

end

Day_6.new.process_instructions

# toggle 0,0 through 999,0