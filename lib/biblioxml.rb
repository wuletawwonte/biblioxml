# frozen_string_literal: true

require "nokogiri"
require "zeitwerk"

loader = Zeitwerk::Loader.for_gem(warn_on_extra_files: false)
loader.ignore("#{__dir__}/biblioxml.rb")
loader.setup

bible_xml = Biblioxml::BibleFile.read("tmp/WolayttaBible.xml")
content = Biblioxml::ToZefania.new(bible_xml).convert
Biblioxml::BibleFile.write("tmp/WolayttaBible.zefania.xml", content)
