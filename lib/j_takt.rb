# frozen_string_literal: true

require_relative "j_takt/version"
require_relative "j_takt/record"
require_relative "j_takt/report"

Dir["#{File.dirname(__FILE__)}/j_takt/record/*.rb"].sort.each { |file| require file }

module JTakt
  class Error < StandardError; end
end
