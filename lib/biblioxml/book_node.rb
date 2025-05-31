# frozen_string_literal: true

module Biblioxml
  class BookNode
    attr_reader :chapters
    attr_accessor :name

    def initialize(name:)
      @name = name
      @chapters = []
    end

    def add_chapter(chapter)
      @chapters << chapter
    end
  end
end
