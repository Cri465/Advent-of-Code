class Day3
  attr_reader :width, :data, :length

  def initialize(input)
    @data = input.split("\n").map!(&:chars)
    @width = @data[0].length
    @length = @data.length
  end

  def max
    @max ||= 2**width
  end

  def binary_array
    @binary_array ||= data.map{|v| width.times.map{|i| v[i].zero? ? -1 : 1 }.reverse }
  end

  def column_sums
    @column_sums ||=
      binary_array.reduce{|a, b| width.times.map{|w| a[w] + b[w] } }
  end

  def gamma_epsilon
    @gamma_epsilon ||=
      column_sums.each_with_object(gamma: 0, epsilon: 0) do |p, result|
        result[:gamma] <<= 1
        result[:epsilon] <<= 1
        result[p.negative? ? :epsilon : :gamma] += 1
      end
  end

  def least_most(array, bit)
    array.partition{|element| element[bit].zero? }.sort{|a, b| a.count <=> b.count }
  end

  def oxygen(array, bit)
    return array.first if array.count == 1
    oxygen(least_most(array, bit).last, bit - 1)
  end

  def co2(array, bit)
    return array.first if array.count == 1
    co2(least_most(array, bit).first, bit - 1)
  end

  def oxygen_generator_rating
    @oxygen_generator_rating ||= oxygen(@data, width - 1)
  end

  def co2_scrubber_rating
    @co2_scrubber_rating ||= co2(@data, width - 1)
  end

  def life_support_rating
    @life_support_rating ||= oxygen_generator_rating * co2_scrubber_rating
  end

  def power_consumption
    @power_consumption ||= gamma_epsilon.values.reduce(&:*)
  end
end

file_data = File.read('day_three.txt')
test = Day3.new(file_data)
p test.power_consumption
