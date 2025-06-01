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
      csv_content = records
                    .map(&:to_csv)
                    .join("\r\n")

      # Replace specific Unicode characters that cannot be converted to Shift_JIS
      sanitized_content = sanitize_for_shift_jis(csv_content)

      sanitized_content.encode("Shift_JIS", invalid: :replace, undef: :replace, replace: "?")
    end

    private

    # @param content [String]
    # @return [String]
    def sanitize_for_shift_jis(content)
      # Roman numerals mapping
      roman_numerals = {
        "Ⅰ" => "I",    # U+2160
        "Ⅱ" => "II",   # U+2161
        "Ⅲ" => "III",  # U+2162
        "Ⅳ" => "IV",   # U+2163
        "Ⅴ" => "V",    # U+2164
        "Ⅵ" => "VI",   # U+2165
        "Ⅶ" => "VII",  # U+2166
        "Ⅷ" => "VIII", # U+2167
        "Ⅸ" => "IX",   # U+2168
        "Ⅹ" => "X",    # U+2169
        "Ⅺ" => "XI",   # U+216A
        "Ⅻ" => "XII"   # U+216B
      }

      # Apply Roman numeral replacements
      result = content
      roman_numerals.each do |unicode_char, ascii_equiv|
        result = result.gsub(unicode_char, ascii_equiv)
      end

      result
    end
  end
end
