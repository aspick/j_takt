# frozen_string_literal: true

module JTakt
  class Record
    # represents index number on j-tack form
    class Number
      attr :number

      # @param number [Integer]
      def initialize(number)
        raise "Invalid number: 0 <= x < 1000" unless (number >= 0) && (number < 1000)
        raise "Invalid number: should be Integer" unless number.is_a?(Integer)

        @number = number
      end

      # @return [String] zero padding 3 digits number string
      # @example '001'
      def to_s
        number.to_s.rjust(3, "0")
      end
    end
  end
end
