class Byte
  attr_reader :str

  def initialize(value)
    @str = value.to_s(2)
  end

  def ones
    @str.count('1')
  end

  def +(other)
    if other.is_a? Numeric
      self.ones + other
    else
      self.ones + other.ones
    end
  end

  def coerce(other)
     return self, other
   end

  def ==(other)
    self.str == other.str
  end
end
