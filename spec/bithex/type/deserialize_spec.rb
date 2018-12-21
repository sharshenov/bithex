describe Bithex::Type, '#deserialize' do
  subject { type.deserialize(value) }

  let(:type) { described_class.new(:attr_name, bit_subtype) }

  context 'when nil given' do
    let(:value) { nil }

    it { is_expected.to eq nil }
  end

  context 'when blank string given' do
    let(:value) { '' }

    it { is_expected.to eq nil }
  end

  context 'when hex string given' do
    let(:value) { '0000111110111010' }

    it { is_expected.to eq '0fba' }
  end
end
