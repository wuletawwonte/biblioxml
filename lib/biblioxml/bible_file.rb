# frozen_string_literal: true

module Biblioxml
  module BibleFile
    class << self
      def read(file_path)
        File.open(file_path) do |bible_file|
          Nokogiri::XML(bible_file)
        end
      rescue Errno::ENOENT
        puts "Error: File not found - #{file_path}"
      end

      def write(file_path, content)
        File.open(file_path, 'w') do |file|
          file.write(content)
        end
      end
    end
  end
end
