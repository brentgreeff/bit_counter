require './lib/byte'

class ByteFile

  def initialize(path)
    @path = path
    @byte_count = nil
  end

  def ones_and_zeroes
    ones = self.reduce(:+)
    [
      ones,
      get_zeroes(ones)
    ]
  end

  def get_zeroes(ones)
    (@byte_count * 8) - ones
  end

  include Enumerable

  def each
    @byte_count = 0

    File.open(@path, 'rb') do |f|

      f.each_byte do |byte|
        @byte_count += 1
        yield Byte.new byte
      end
    end
  end
end
