# frozen_string_literal: true

RSpec.describe JTakt::Record::JasracCode do
  describe ".initialize" do
    subject { described_class.new(code) }

    context "when passed valid jasrac code" do
      let(:code) { "1234-5678" }
      it { is_expected.to be_a(described_class) }
    end

    context "when passed invalid jasrac code" do
      let(:code) { "1234=5678" }
      it do
        expect { subject }.to raise_error "Invalid jasrac code: should only contain 0-9 and `-`"
      end
    end
  end

  describe "#to_s" do
    subject { described_class.new(code).to_s }
    let(:code) { "1234-5678" }

    it { is_expected.to eq "12345678" }
  end
end
