# frozen_string_literal: true

require_relative "biblioxml/version"
require_relative "biblioxml/parser"
require_relative "biblioxml/bible_tree"
require_relative "biblioxml/testament_node"
require_relative "biblioxml/book_node"
require_relative "biblioxml/chapter_node"
require_relative "biblioxml/verse_node"

module Biblioxml
  class Error < StandardError; end

  def self.parse(file_path)
    parser = Parser.new(file_path)
    parser.read
  end
end
