# frozen_string_literal: true

require "nokogiri"
require "zeitwerk"

loader = Zeitwerk::Loader.for_gem
loader.ignore("lib/biblioxml.rb")
loader.setup

module Biblioxml
  def self.parse(file_path)
    file_reader = Biblioxml::Reader.new(file_path)
    file_reader.read
  end

  def self.convert(bible_xml)
    to_zephaniah = Biblioxml::ToZefania.new(bible_xml)
    to_zephaniah.convert
  end
end

bible_xml = Biblioxml.parse("tmp/WolayttaBible.xml")
content = Biblioxml.convert(bible_xml)
Biblioxml::Writer.write_to_file("tmp/WolayttaBible.zefania.xml", content)
