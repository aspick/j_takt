# frozen_string_literal: true

module JTakt
  class Record
    # represents information fee of content
    class InformationFee
      attr :fee

      # @param fee [Float]
      def initialize(fee)
        @fee = fee
      end

      # @return [String]
      def to_s
        fee.to_f.floor(2).to_s
      end
    end
  end
end
