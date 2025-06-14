# frozen_string_literal: true

module Biblioxml
  class ChapterNode
    attr_reader :verses
    attr_accessor :number

    def initialize(number:)
      @number = number
      @verses = []
    end

    def add_verse(verse)
      @verses << verse
    end
  end
end
