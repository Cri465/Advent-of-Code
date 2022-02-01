class DayFour
  attr_accessor :data, :draw

  def initialize
    read_input
  end

  def read_input
    file_data = File.read('day_four.txt')
    @data = file_data.split("\n").reject(&:empty?)
    @draw = @data.shift.split(',')
    @data.map! { |x| x.split(' ') }
  end
end
bingo = DayFour.new

p bingo.draw
bingo.data.each do |x|
  p x
end
