require './lib/count_bits'

RSpec.describe 'CountingBits' do

  context "File with bytes" do
    let(:file) { double('file') }

    it "prints the correct output" do
      expect(File).to receive(:open)
        .with('fixtures/imaginary', 'rb')
        .and_yield(file)

      expect(file).to receive(:each_byte)
        .and_yield(0b10101010)
        .and_yield(0b01010101)

      expect { count_bits('fixtures/imaginary') }
        .to output(results).to_stdout
    end

    def results
    <<~HEREDOC
      found 8 bits set to 1
      found 8 bits set to 0
    HEREDOC
    end
  end
end
