require_relative '../string_calc'

describe StringCalc do
  describe '#add' do
    context 'when passed a non-string input' do
      it 'raises ArgumentError with correct message' do
        expect { described_class.add('5') }.not_to raise_error(ArgumentError, 'Invalid input! Please add only string')
      end
    end

    context "when passed a string input" do
      it 'does not raise any error' do
        expect { described_class.add(142) }.to raise_error(ArgumentError, 'Invalid input! Please add only string')
      end
    end

    context "when passed an empty string" do
      it 'returns zero' do
        expect(described_class.add(" ")).to eq(0)
      end
    end

    context "when passed an string inputs with commas" do
      it 'returns the correct sum' do
        expect(described_class.add("1,2,3")).to eq(6)
      end
    end

    context 'when passed an numbers separated by commas and new lines' do
      it 'returns the correct sum for it' do
        expect(StringCalc.add("1\n2,3")).to eq(6)
        expect(StringCalc.add("4,5\n6")).to eq(15)
      end
    end
  end
end
