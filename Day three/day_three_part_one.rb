class DayThree
  attr_accessor :data
  
  def initialize(data)
    @data = parse_input(data)
    @gamma = 0
    @epsilon = 0
  end

  def parse_input(input)
    input.split("\n").map! { |x| x.split('') }.transpose
  end

  def find_rates
    gamma = ''
    epsilon = ''
    @data.each do |i|
      i = i.join
      if i.count('1') > i.count('0')
        gamma += '1'
        epsilon += '0'
      else
        epsilon += '1'
        gamma += '0'
      end
    end
    @epsilon = epsilon
    @gamma = gamma
  end

  def solve
    p @gamma.to_i(2) * @epsilon.to_i(2)
  end
end

file_data = File.read('day_three.txt')
solvey = DayThree.new(file_data)
solvey.find_rates
solvey.solve
