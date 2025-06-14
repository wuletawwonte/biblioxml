# frozen_string_literal: true

module Biblioxml
  class Reader
    attr_reader :file_path

    def initialize(file_path)
      @file_path = file_path
    end

    def read
      File.open(@file_path) do |bible_file|
        Nokogiri::XML(bible_file)
      end
    rescue Errno::ENOENT
      puts "Error: File not found - #{file_path}"
    end
  end
end
