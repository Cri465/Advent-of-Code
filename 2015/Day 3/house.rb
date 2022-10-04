class House < Hash
  def initialize
    super 
    self[:north] = 'bones'
    self[:south] = 'beans'
    self[:east] = 'jeans'
    self[:west] = 'jones'
  end
end
