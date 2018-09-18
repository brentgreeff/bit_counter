require './lib/byte_file'

def count_bits(path)
  ones, zeroes = ByteFile.new(path).ones_and_zeroes

  puts "found #{ones} bits set to 1"
  puts "found #{zeroes} bits set to 0"
end
