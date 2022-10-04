require_relative 'house'

class Day3
  def initialize
    x = House.new
    p x[:north]
  end
end

Day3.new

#Instead, I would suggest having a normal class that only uses a hash as an internal data structure (which could be easily and idiomatically exposed with a to_h method).

