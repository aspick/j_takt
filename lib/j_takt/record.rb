# frozen_string_literal: true

module JTakt
  # represent single csv row
  class Record
    attr :interface_keycode, :content_segment, :content_number, :medley_segment, :medley_number,
         :correct_code, :jasrac_code, :title, :sub_title, :lyricist, :supplement_lyricist,
         :composer, :arranger, :artist, :information_fee, :itv_segment,
         :original_text_or_translated, :il_segment, :request_count

    # @param interface_keycode [String] unique id of content on your system
    # @param content_segment [ContainedContentSegment]
    # @param content_number [Integer]
    # @param medley_segment [MedleySegment]
    # @param medley_number [Integer]
    # @param jasrac_code [String]
    # @param correct_code [String]
    # @param title [String]
    # @param sub_title [String]
    # @param lyricist [String]
    # @param supplement_lyricist [String]
    # @param composer [String]
    # @param arranger [String]
    # @param artist [String]
    # @param information_fee [Float]
    # @param itv_segment [UsingContentType]
    # @param original_text_or_translated [OriginalTextOrTranslated]
    # @param il_segment [UsingRecordingPublishedIn]
    # @param request_count [Integer]
    def initialize(
      interface_keycode:,
      content_segment: ContainedContentSegment::SINGLE_CONTENT,
      content_number: 0,
      medley_segment: MedleySegment::NOT_MEDLEY,
      medley_number: 0,
      jasrac_code:,
      correct_code: nil,
      title:, 
      sub_title: nil,
      lyricist: nil,
      supplement_lyricist: nil,
      composer: nil,
      arranger: nil,
      artist: nil,
      information_fee: 0,
      ivt_segment:,
      original_text_or_translated: nil,
      il_segment: nil,
      request_count:
    )
      @interface_keycode = interface_keycode
      @content_segment = content_segment
      @content_number = Number.new(content_number)
      @medley_segment = medley_segment
      @medley_number = Number.new(medley_number)
      @correct_code = correct_code
      @jasrac_code = JasracCode.new(jasrac_code)
      @title = title
      @sub_title = sub_title
      @lyricist = lyricist
      @supplement_lyricist = supplement_lyricist
      @composer = composer
      @arranger = arranger
      @artist = artist
      @information_fee = InformationFee.new(information_fee)
      @ivt_segment = ivt_segment
      @original_text_or_translated = original_text_or_translated
      @il_segment = il_segment
      @request_count = RequestCount.new(request_count)
    end

    # @return [String] csv row tab separated
    def to_csv
      [
        @interface_keycode,
        @content_segment,
        @content_number,
        @medley_segment,
        @medley_number,
        @correct_code,
        @jasrac_code,
        @title,
        @sub_title,
        @lyricist,
        @supplement_lyricist,
        @composer,
        @arranger,
        @artist,
        @information_fee,
        @ivt_segment,
        @original_text_or_translated,
        @il_segment,
        @request_count
      ]
        .map(&:to_s)
        .join("\t")
    end
  end
end
