# frozen_string_literal: true

module Biblioxml
  class CLI < Thor
    desc "convert INPUT", "Convert Bible XML to Zefania format"
    option :output, aliases: "-o", desc: "Output file path"
    def convert(input)
      puts "Converting Bible XML file", :red
    end

    desc "version", "Show version"
    def version
      say "Bible XML Converter #{VERSION}", :blue
    end
  end
end
