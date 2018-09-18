require './lib/byte'

RSpec.describe Byte do

  context 'passing 11110000' do

    it 'has 4 ones' do
      expect( Byte.new(0b11110000).ones ).to eq 4
    end
  end

  context 'passing 10000001' do

    it 'has 2 ones' do
      expect( Byte.new(0b10000001).ones ).to eq 2
    end
  end

  context 'adding three ones' do
    let(:three) { Byte.new(0b10010001) }

    context 'with 4 ones' do
      let(:four) { Byte.new(0b11001100) }

      it 'equals 7 ones' do
        expect(three + four).to eq 7
      end
    end
  end

  context 'adding four ones' do
    let(:four) { Byte.new(0b11110000) }

    context 'with an integer' do
      let(:six) { 6 }

      it 'equals 10 ones' do
        expect(four + six).to eq 10
      end
    end
  end

  context 'adding four' do
    let(:four) { 4 }

    context 'with 6 ones' do
      let(:six) { Byte.new(0b11110110) }

      it 'equals 10 ones' do
        expect(four + six).to eq 10
      end
    end
  end
end
