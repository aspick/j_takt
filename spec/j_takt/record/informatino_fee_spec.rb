# frozen_string_literal: true

RSpec.describe JTakt::Record::InformationFee do
  describe "#to_s" do
    subject { described_class.new(fee).to_s }
    let(:fee) { 23.456 }

    it { is_expected.to eq "23.45" }
  end
end
