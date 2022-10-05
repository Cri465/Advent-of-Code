class House
  attr_accessor :north, :south, :east, :west

  def initialize(north: nil, south: nil, east: nil, west: nil)
    @north = north
    @south = south
    @east = east
    @west = west
    @this = { north: north, south: south, east: east, west: west }
  end

  def to_h
    @this
  end

  def ^
    north
  end

  def v
    south
  end

  def <
    west
  end

  def >
    east
  end

  def [](key)
    { "^" => north, "v" => south, ">" => east, "<" => west }[key]
  end

  def []=(key, value)
    @this[{ "^" => north, "v" => south, ">" => east, "<" => west }[key]] = value
  end
end
