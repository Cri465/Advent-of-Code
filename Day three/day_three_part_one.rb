require 'byebug'

class DayThree
  attr_accessor :solved_gas, :solved_radio

  def initialize(data)
    parse_input(data)
    gamma_rate
    epsilon_rate
    solve_radio
    oxygen_rate
    c02_rate
    solve_gas
  end

  def parse_input(input)
    @data = input.split("\n").map!(&:chars)
  end

  # least common
  def epsilon_rate(data = @data)
    data = data.transpose
    epsilon = ''
    data.each do |i|
      i = i.join
      epsilon += if i.count('0') > i.count('1')
                   '1'
                 else
                   '0'
                 end
    end
    @epsilon = epsilon
  end

  # most common
  def gamma_rate(data = @data)
    data = data.transpose
    gamma = ''
    data.each do |i|
      i = i.join
      gamma += if i.count('1') < i.count('0')
                 '0'
               else
                 '1'
               end
    end
    @gamma = gamma
  end

  def oxygen_rate
    oxygen_rate = @data.clone
    ga = @gamma.chars
    @gamma.length.times do |i|
      oxygen_rate.select!{|element| element[i] == ga[i] }
      ga = gamma_rate(oxygen_rate)
    end
    @oxygen = oxygen_rate.join
  end

  def c02_rate
    c02_rate = @data.clone
    ep = @epsilon.chars
    @epsilon.length.times do |i|
      c02_rate.select!{|element| element[i] == ep[i] }
      ep = epsilon_rate(c02_rate)
      break if c02_rate.length == 1
    end
    @c02 = c02_rate.join
  end

  def solve_radio
    byebug
    @solved_radio = @gamma.to_i(2) * @epsilon.to_i(2)
  end

  def solve_gas
    @solved_gas = @c02.to_i(2) * @oxygen.to_i(2)
  end
end

file_data = File.read('day_three.txt')
submarine = DayThree.new(file_data)
p submarine.solved_radio
p submarine.solved_gas
