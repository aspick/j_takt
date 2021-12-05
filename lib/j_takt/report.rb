# frozen_string_literal: true

module JTakt
  # represent single csv file to report
  class Report
    attr :records

    # @param records [Array<Content>]
    def initialize(records)
      @records = records
    end

    # @return [String] csv content string with Shift_JIS encode
    def to_csv
      records
        .map(&:to_csv)
        .join("\r\n")
        .encode("Shift_JIS")
    end
  end
end
