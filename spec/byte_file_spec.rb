require './lib/byte_file'

RSpec.describe ByteFile do

  context '11111111_11011000_11111111' do
    let(:file) do
      './spec/fixtures/11111111_11011000_11111111'
    end

    it 'yields three bytes' do
      bytes = ByteFile.new(file)

      expect do |b|
        bytes.each(&b)
      end.to yield_successive_args(
        Byte.new(0b11111111),
        Byte.new(0b11011000),
        Byte.new(0b11111111),
      )
    end

    it 'has 20 ones and 4 zeroes' do
      ones, zeroes = ByteFile.new(file).ones_and_zeroes

      expect(ones).to eq 20
      expect(zeroes).to eq 4
    end
  end

  context 'passing 10110111_01110111' do
    let(:file) { './spec/fixtures/10110111_01110111' }

    it 'has 12 ones and 4 zeroes' do
      ones, zeroes = ByteFile.new(file).ones_and_zeroes

      expect(ones).to eq 12
      expect(zeroes).to eq 4
    end
  end
end
