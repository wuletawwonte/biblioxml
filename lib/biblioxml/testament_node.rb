# frozen_string_literal: true

module Biblioxml
  class TestamentNode
    TESTAMENTS = %w[old new].freeze

    attr_reader :books
    attr_accessor :name

    def initialize(name:)
      @name = TESTAMENTS.include?(name) ? name : "new"
      @books = []
    end

    def add_book(book)
      @books << book
    end
  end
end
