# frozen_string_literal: true
require "nokogiri"

module Biblioxml
  class Parser
    def initialize(file_path)
      @file_path = file_path
    end

    def read
      Nokogiri::XML(File.read(@file_path))
    end
  end
end
