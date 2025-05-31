# frozen_string_literal: true

require_relative 'testament_node'

module Biblioxml
  class BibleTree
    attr_reader :testaments
    attr_accessor :translation, :status, :link

    def initialize(translation: "", status: "", link: "")
      @translation = translation
      @status = status
      @link = link
      @testaments = [Biblioxml::TestamentNode.new(name: "old"), Biblioxml::TestamentNode.new(name: "new")]
    end

    def new_testament
      @testaments.find { |t| t.name == "new" }
    end

    def old_testament
      @testaments.find { |t| t.name == "old" }
    end
  end
end
