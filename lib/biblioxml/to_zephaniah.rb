# frozen_string_literal: true

module Biblioxml
  class ToZephaniah
    def initialize(file_content)
      @file_content = file_content
    end

    def convert
    @file_content.root["translation"]
    end
  end
end
