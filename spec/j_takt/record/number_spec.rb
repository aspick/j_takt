# frozen_string_literal: true

RSpec.describe JTakt::Record::Number do
  describe ".initialize" do
    subject { described_class.new(number) }

    context "when passed 0" do
      let(:number) { 0 }
      it { is_expected.to be_a(JTakt::Record::Number) }
    end

    context "when passed 1000" do
      let(:number) { 1000 }
      it do
        expect { subject }.to raise_error("Invalid number: 0 <= x < 1000")
      end
    end

    context "when passed -1" do
      let(:number) { -1 }
      it do
        expect { subject }.to raise_error("Invalid number: 0 <= x < 1000")
      end
    end

    context "when passed 3.3" do
      let(:number) { 3.3 }
      it do
        expect { subject }.to raise_error("Invalid number: should be Integer")
      end
    end
  end

  describe "#to_s" do
    subject { described_class.new(number).to_s }

    context "when passed 1" do
      let(:number) { 1 }
      it { is_expected.to eq "001" }
    end

    context "when passed 123" do
      let(:number) { 123 }
      it { is_expected.to eq "123" }
    end
  end
end
