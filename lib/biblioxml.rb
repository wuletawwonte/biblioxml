# frozen_string_literal: true

require "nokogiri"
require "zeitwerk"

loader = Zeitwerk::Loader.for_gem
loader.ignore("lib/biblioxml.rb")
loader.setup

module Biblioxml
  def self.parse(file_path)
    parser = Parser.new(file_path)
    parser.read
  end
end
