require_relative '../string_calc'

describe StringCalc do
  describe '#add' do
    context 'when passed a non-string input' do
      it 'raises ArgumentError with correct message' do
        expect { described_class.add(142) }.to raise_error(ArgumentError, 'Invalid input! Please add only string')
      end
    end

    context "when passed a string input" do
      it 'does not raise any error' do
        expect { described_class.add('5') }.not_to raise_error(ArgumentError, 'Invalid input! Please add only string')
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

    context 'when passed an numbers with trailing newline' do
      it 'raises an error for input' do
        expect { StringCalc.add("1,2,\n") }.to raise_error(ArgumentError, 'Invalid input format')
        expect { StringCalc.add("1\n") }.to raise_error(ArgumentError, 'Invalid input format')
      end
    end

    context 'when passed an numbers with newline followed by space' do
      it 'raises an error for input' do
        expect { StringCalc.add("1,\n 2") }.to raise_error(ArgumentError, 'Invalid input format')
        expect { StringCalc.add("1\n 2") }.to raise_error(ArgumentError, 'Invalid input format')
      end
    end

    context 'when passed an input with negative numberse' do
      it 'raises an error for input' do
        expect { StringCalc.add("1,-2,3,-4") }.to raise_error(ArgumentError, 'Negatives not allowed: -2, -4')
      end
    end

    context 'when passed an input with custom delimiter' do
      it 'supports input and returns sum of it' do
        expect(StringCalc.add("//;\n1;2")).to eq(3)
        expect(StringCalc.add("//*\n3*4*5")).to eq(12)
        expect(StringCalc.add("//|\n10|20|30")).to eq(60)
      end
    end
  end
end
