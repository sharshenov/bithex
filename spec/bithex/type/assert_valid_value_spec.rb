describe Bithex::Type, '#assert_valid_value' do
  subject { type.assert_valid_value(value) }

  let(:type) { described_class.new(:attr_name, bit_subtype) }

  context 'when nil given' do
    let(:value) { nil }

    it 'does not raise error' do
      expect { subject }.not_to raise_error
    end
  end

  context 'when blank string given' do
    let(:value) { '' }

    it 'does not raise error' do
      expect { subject }.not_to raise_error
    end
  end

  context 'when valid length hex string given' do
    let(:value) { '0fba' }

    it 'does not raise error' do
      expect { subject }.not_to raise_error
    end
  end

  context 'when valid length nonhex string given' do
    let(:value) { 'oops' }

    it 'raises ArgumentError' do
      expect { subject }.to raise_error ArgumentError,
                                        "Expected 'oops' to be a hex string"
    end
  end

  context 'when invalid length hex string given' do
    let(:value) { '0fba123' }

    it 'raises ArgumentError' do
      expect { subject }.to raise_error ArgumentError,
                                        "Expected length of '0fba123' to be equal to 4"
    end
  end
end
