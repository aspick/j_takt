# frozen_string_literal: true

module JTakt
  class Record
    # represents jasrac code
    class JasracCode
      attr :code

      # @param code [String] jasrac code
      def initialize(code)
        raise "Invalid jasrac code: should only contain 0-9 and `-`" if /[^0-9\-]/.match(code)

        @code = code
      end

      # @param [String]
      def to_s
        @code.gsub(/-/, "")
      end
    end
  end
end
