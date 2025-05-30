# frozen_string_literal: true

require_relative "biblioxml/version"
require_relative "biblioxml/parser"

module Biblioxml
  class Error < StandardError; end

  def self.parse(file_path)
    parser = Parser.new(file_path)
    parser.read
  end
end
