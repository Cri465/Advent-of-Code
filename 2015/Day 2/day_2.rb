require '../helpers/helpers'

class Day2
  include Helpers
  def initialize
    @puzzle_input = Helpers.read_puzzle_input
    resultpart1
    resultpart2
  end

  def parse_input_part_one
    dimensions = [ :l, :w, :h ]
    parsed_input = []
    @puzzle_input.split("\n").each do |i|
      parsed_input.push(Hash[dimensions.zip(i.split('x').map!(&:to_i))])
    end
    parsed_input
  end

  def first_face(len, wid)
    len * wid
  end

  def second_face(wid, hei)
    wid * hei
  end

  def third_face(hei, len)
    hei * len
  end

  def find_shortest_route(pressie)
    routes = pressie.values.combination(2)
    routes.map{|i| i.sum * 2 }.min
  end

  def area(pressie)
    first = first_face(pressie[:l], pressie[:w])
    second = second_face(pressie[:w], pressie[:h])
    third = third_face(pressie[:h], pressie[:l])
    [ first, second, third ]
  end

  def volume(pressie)
    pressie.values.inject(:*)
  end

  def smallest_perimeter(pressie)
    area(pressie).min * 4
  end

  def shortest_route_or_perimeter(pressie)
    [ smallest_perimeter(pressie), find_shortest_route(pressie) ].min
  end

  def area_plus_extra(pressie)
    (area(pressie).sum * 2) + area(pressie).min
  end

  def ribbon_plus_bow(pressie)
    [ shortest_route_or_perimeter(pressie), volume(pressie) ].sum
  end

  def resultpart1
    acc = 0
    parse_input_part_one.each{|i| acc += area_plus_extra(i) }
    p acc
  end

  def resultpart2
    acc = 0
    parse_input_part_one.each{|i| acc += ribbon_plus_bow(i) }
    # p ribbon_plus_bow(parse_input_part_one[0])
    p acc
  end

end

Day2.new
