require 'byebug'

class Day_one

  def parse_input(input)
    @input = input.split.map(&:to_i)
  end

  def comparitor
    counter = 0
    prev = nil
    @input.each do |num|
      prev = num if prev.nil?
      counter += 1 if num > prev
      prev = num
    end
    counter
  end
end

test = Day_one.new
file_data = File.read('day_one_part_one.txt')
test.parse_input(file_data)
p test.comparitor
