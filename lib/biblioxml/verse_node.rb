# frozen_string_literal: true

module Biblioxml
  class VerseNode
    attr_accessor :number, :text

    def initialize(number:, text:)
      @number=number
      @text=text
    end
  end
end
