# frozen_string_literal: true

RSpec.describe JTakt::Record::RequestCount do
  describe ".initialize" do
    subject { described_class.new(number) }

    context "when passed positive number" do
      let(:number) { 100 }
      it { is_expected.to be_a(described_class) }
    end

    context "when passed negative number" do
      let(:number) { -1 }
      it do
        expect { subject }.to raise_error("Invalid count: should 0 <= count")
      end
    end
  end

  describe "#to_s" do
    subject { described_class.new(number).to_s }

    context "when passed 10" do
      let(:number) { 10 }
      it { is_expected.to eq "10" }
    end

    context "when passed 1000" do
      let(:number) { 1000 }
      it { is_expected.to eq "1000" }
    end
  end
end
