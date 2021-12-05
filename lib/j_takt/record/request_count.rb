# frozen_string_literal: true

module JTakt
  class Record
    # represents request count of content on month
    class RequestCount
      attr :count

      # @param count [Integer]
      def initialize(count)
        raise "Invalid count: should 0 <= count" unless count >= 0

        @count = count
      end

      def to_s
        count.to_s
      end
    end
  end
end
