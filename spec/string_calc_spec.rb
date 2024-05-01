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
  end
end
